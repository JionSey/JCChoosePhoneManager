//
//  ViewController.m
//  ChoosePP
//
//  Created by Jackie on 2016/12/3.
//  Copyright © 2016年 Jockie. All rights reserved.
//

#import "ViewController.h"
#import "JCChoosePhoneManager.h"
#import "JCChoosePhoneView.h"
#import "JCCustomChooseView.h"

@interface ViewController ()

@property (nonatomic, strong) JCChoosePhoneView  *choosePhoneView;
@property (nonatomic, strong) JCCustomChooseView *customChooseView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.choosePhoneView];
    
    // 设置自定义选择框 父视图
    [[JCChoosePhoneManager showChoosePhoneManager] configCustomChooseView:self.customChooseView superView:self.view];
    
    // 举例视图
    [self choosePhoneViewBtnClickBlock];
    
    // 定义图片选择视图具体回调
    [self configTheChoosePhoneManager];
}

- (void)choosePhoneViewBtnClickBlock {

    __weak typeof(self)  weakSelf   = self;
    _choosePhoneView.choosePhoneViewBtnClick = ^(NSInteger index){
        
        JCChoosePhoneManagerSetType choosePhoneManagerSetType = JCChoosePhoneNoOptimizeNoVPImageType;
        switch (index) {
            case JCChoosePhoneNoOptimizeNoVPImageType:
            {
                choosePhoneManagerSetType = JCChoosePhoneNoOptimizeNoVPImageType;
            }
                break;
            case JCChoosePhoneNoOptimizeHaveVPImageType:
            {
                choosePhoneManagerSetType = JCChoosePhoneNoOptimizeHaveVPImageType;
            }
                break;
            case JCChoosePhoneHaveOptimizeNoVPImageType:
            {
                choosePhoneManagerSetType = JCChoosePhoneHaveOptimizeNoVPImageType;
            }
                break;
            case JCChoosePhoneHaveOptimizeHaveVPImageType:
            {
                choosePhoneManagerSetType = JCChoosePhoneHaveOptimizeHaveVPImageType;
            }
                break;
            default:
                break;
        }
        
        [[JCChoosePhoneManager showChoosePhoneManager] starToChooseThePhoneWithCurrentVC:weakSelf type:choosePhoneManagerSetType];
    };
}

- (void)configTheChoosePhoneManager {

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
}

- (JCChoosePhoneView *)choosePhoneView {
    if (!_choosePhoneView) {
        _choosePhoneView = [[JCChoosePhoneView alloc] initWithFrame:self.view.bounds];
    }
    return _choosePhoneView;
}

- (JCCustomChooseView *)customChooseView {
    if (!_customChooseView) {
        _customChooseView = [[JCCustomChooseView alloc] initWithFrame:self.view.bounds];
    }
    return _customChooseView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
