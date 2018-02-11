# JCChoosePhoneManager

###1.架构组成及部分功能代码介绍

* JCCustomChooseProtocol         控件协议
* JCCustomChooseView             默认控件（可自制控件）
* JCChoosePhoneManager           管理工具
* JCVPImageCropperViewController 图片管理类
* Aspects                        第三方（钩子类库）

###### JCCustomChooseProtocol 定义了自定义控件的主要功能协议，控件必须遵守协议并实现功能。用户只需要管理实现这些协议即可快速集成自己的控件选取框。
````
// 选择拍照
- (void)chooseCamera;

// 选择相册
- (void)choosePhoto;

// 取消选择
- (void)cencleChoose;

// 展示
- (void)show;

// 隐藏
- (void)dissmiss;

````

###### JCCustomChooseView 作者定义的一个defule控件，里面遵守JCCustomChooseProtocol并实现。用户可以把聚焦的重点放在UI的定制上。

###### JCChoosePhoneManager 主要功能的管理者，逻辑的处理方，功能枚举可监听用户行为。
````
// 选择相册类型设置枚举
typedef enum : NSUInteger {
// 无优化图片并不选择使用VPImage
JCChoosePhoneNoOptimizeNoVPImageType = 0,
// 无优化图片并选择使用VPImage
JCChoosePhoneNoOptimizeHaveVPImageType,
// 优化图片并不选择使用VPImage
JCChoosePhoneHaveOptimizeNoVPImageType,
// 优化图片并选择使用VPImage
JCChoosePhoneHaveOptimizeHaveVPImageType
} JCChoosePhoneManagerSetType;

// 弹出框之后拍照行为
typedef enum : NSUInteger {
// 选择照相机
JCChooseGetPhotoCameraType,
// 选择相册
JCChooseGetPhotoPhotosType,
// 取消选择
JCChooseGetPhotoCancelType
} JCChooseGetPhotoType;

// 选取视图
typedef enum : NSUInteger {
// 系统选取框
JCChooseSystemViewType,
// 自定义选取框
JCChooseCustomViewType
} JCChooseViewType;

````
###### 实现以下方法传入协议控件可定制自己的试图控件。如果不实现，组件会以系统默认弹窗的形式进行实现

````
/**
*  @author XiaoJianJie, 16-06-30 17:06:00
*
*  @brief 设置选取视图
*
*  @param customChooseView 自定义的选取视图
*/
- (void)configCustomChooseView:(UIView <JCCustomChooseProtocol> *)customChooseView superView:(UIView *)superView;

````

###### 可根据业务选择不同的功能模式，调用该方法会弹出自定义控件

````
/**
*  @author XiaoJianJie, 16-06-30 17:06:00
*
*  @brief 开始使用选取图片管理器
*
*  @param currentVC 使用的控制器
*  @param type      设置的类型
*/
- (void)starToChooseThePhoneWithCurrentVC:(UIViewController *)currentVC
type:(JCChoosePhoneManagerSetType)type;

````

###### 下列两个方法可根据自己的需要进行调用，不会和协议控件进行耦合。可直接触发系统功能（拍照，相册）。

````
/**
*  @author XiaoJianJie, 16-06-30 18:06:21
*
*  @brief 拍照获取图片
*
*  @param currentVC 使用的控制器
*/
- (void)getPhoneForCameraWithCurrentVC:(UIViewController *)currentVC;

/**
*  @author XiaoJianJie, 16-06-30 18:06:21
*
*  @brief 相册获取图片
*
*  @param currentVC 使用的控制器
*/
- (void)getPhoneForPhotosWithCurrentVC:(UIViewController *)currentVC;

````
###### JCVPImageCropperViewController 使用的是VPImageCropperViewController为了避免命名空间问题添加了前缀

###### Aspects 第三方框架，主要是为了实现协议控件与功能之间的绑定与桥接。
````
- (void)setCustomChooseHook {

__block JCChooseGetPhotoType chooseGetPhotoType = JCChooseGetPhotoCancelType;
__weak typeof(self)  weakSelf   = self;
if (!NSClassFromString(@"XCTestCase")) {
[self.customChooseView aspect_hookSelector:NSSelectorFromString(@"chooseCamera") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
chooseGetPhotoType = JCChooseGetPhotoCameraType;
[weakSelf paiZhao];
[weakSelf.customChooseView dissmiss];
if (weakSelf.chooseGetPhotoWayOfAct) {
weakSelf.chooseGetPhotoWayOfAct(chooseGetPhotoType);
}
} error:NULL];

[self.customChooseView aspect_hookSelector:NSSelectorFromString(@"choosePhoto") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
chooseGetPhotoType = JCChooseGetPhotoPhotosType;
[weakSelf xiangCe];
[weakSelf.customChooseView dissmiss];
if (weakSelf.chooseGetPhotoWayOfAct) {
weakSelf.chooseGetPhotoWayOfAct(chooseGetPhotoType);
}
} error:NULL];

[self.customChooseView aspect_hookSelector:NSSelectorFromString(@"cencleChoose") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
[weakSelf.customChooseView dissmiss];
if (weakSelf.chooseGetPhotoWayOfAct) {
weakSelf.chooseGetPhotoWayOfAct(chooseGetPhotoType);
}
} error:NULL];
}
}

````

###2.测试项目详解

###### 测试项目书写了4种方式的选取UI进行测试。并使用了默认的协议控件。
###### 1.设置自定义选择框视图 (可不设置即使用系统弹窗展示)
````
[[JCChoosePhoneManager showChoosePhoneManager] configCustomChooseView:self.customChooseView superView:self.view];

````

###### 2.根据选取的类型弹出头像选取控件
````
[[JCChoosePhoneManager showChoosePhoneManager] starToChooseThePhoneWithCurrentVC:weakSelf type:choosePhoneManagerSetType];

````

###### 3.根据单例管理器监听用户行为
````
__weak typeof(self)  weakSelf   = self;
[JCChoosePhoneManager showChoosePhoneManager].chooseGetPhotoWayOfAct = ^(JCChooseGetPhotoType type){

switch (type) {
case JCChooseGetPhotoCameraType:
{
NSLog(@"选择照相机");
}
break;
case JCChooseGetPhotoPhotosType:
{
NSLog(@"选择相册");
}
break;
case JCChooseGetPhotoCancelType:
{
NSLog(@"取消选择");
}
break;
default:
break;
}
};

[JCChoosePhoneManager showChoosePhoneManager].chooseImage = ^(UIImage *chooseImage){
NSLog(@"选择的图片为 = %@",chooseImage);
weakSelf.choosePhoneView.chooseImageView.image = chooseImage;
};

[JCChoosePhoneManager showChoosePhoneManager].cancelChooseImage = ^(){
NSLog(@"取消选择图片了");
};

