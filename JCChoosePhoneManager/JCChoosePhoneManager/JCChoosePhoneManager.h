//
//  ChoosePhoneManager.h
//  FeedbackVC
//
//  Created by jianjie on 16/6/30.
//  Copyright © 2016年 jianjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JCCustomChooseProtocol.h"

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

typedef void (^JCChooseGetPhotoWayOfAct)(JCChooseGetPhotoType type);

//选择了图片
typedef void(^JCChooseImage)(UIImage *image);

//取消选择图片
typedef void(^JCCancelChooseImage)(void);

//TODO: 此处值需要修改称app的名字(默认为app名字)
#define __ProjectName__ [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define ORIGINAL_MAX_WIDTH 640.0f

@interface JCChoosePhoneManager : NSObject

@property (nonatomic, strong) JCChooseGetPhotoWayOfAct chooseGetPhotoWayOfAct;
@property (nonatomic, strong) JCChooseImage       chooseImage;
@property (nonatomic, strong) JCCancelChooseImage cancelChooseImage;
@property (nonatomic, strong) NSMutableArray<__kindof UIImage*> *chooseImagesArray;

+ (instancetype)showChoosePhoneManager;

/**
 *  @author XiaoJianJie, 16-06-30 17:06:00
 *
 *  @brief 设置选取视图
 *
 *  @param customChooseView 自定义的选取视图
 */
- (void)configCustomChooseView:(UIView <JCCustomChooseProtocol> *)customChooseView;

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

/**
 *  @author XiaoJianJie, 16-06-30 17:06:49
 *
 *  @brief 清除图片管理集
 */
- (void)cleanTheChoosePhoneArray;

/**
 *  @author XiaoJianJie, 16-07-01 09:07:41
 *
 *  @brief 根据图片调整图片大小
 *
 *  @param sourceImage 想要调整的图片
 *
 */
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage;


@end
