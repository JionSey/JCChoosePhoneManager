//
//  ChoosePhoneManager.m
//  FeedbackVC
//
//  Created by jianjie on 16/6/30.
//  Copyright © 2016年 jianjie. All rights reserved.
//

#import "JCChoosePhoneManager.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "JCVPImageCropperViewController.h"
//#import <Aspects.h>

@interface JCChoosePhoneManager ()
  <UIActionSheetDelegate,
   UINavigationControllerDelegate,
   UIImagePickerControllerDelegate,
   UIAlertViewDelegate>

@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, assign) JCChoosePhoneManagerSetType type;
@property (nonatomic, assign) JCChooseViewType chooseViewType;
@property (nonatomic, strong) UIView <JCCustomChooseProtocol> *customChooseView;

@end

@implementation JCChoosePhoneManager

static id _getChoosePhoneManagerInstance;
+ (instancetype)showChoosePhoneManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _getChoosePhoneManagerInstance = [[[self class] alloc] init];
    });
    return _getChoosePhoneManagerInstance;
}

- (id)init {
    
    self = [super init];
    if (self) {
        self.chooseImagesArray = [NSMutableArray array];
        self.chooseViewType  = JCChooseSystemViewType;
    }
    return self;
}

- (void)configCustomChooseView:(UIView <JCCustomChooseProtocol> *)customChooseView {
    
    self.customChooseView = customChooseView;
    self.chooseViewType  = JCChooseCustomViewType;
    [self setCustomChooseHook];
}

- (void)setCustomChooseHook {
    
//    __block JCChooseGetPhotoType chooseGetPhotoType = JCChooseGetPhotoCancelType;
//    __weak typeof(self)  weakSelf   = self;
//    if (!NSClassFromString(@"XCTestCase")) {
//        [self.customChooseView aspect_hookSelector:NSSelectorFromString(@"chooseCamera") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
//            chooseGetPhotoType = JCChooseGetPhotoCameraType;
//            [weakSelf paiZhao];
//            [weakSelf.customChooseView dissmiss];
//            if (weakSelf.chooseGetPhotoWayOfAct) {
//                weakSelf.chooseGetPhotoWayOfAct(chooseGetPhotoType);
//            }
//        } error:NULL];
//
//        [self.customChooseView aspect_hookSelector:NSSelectorFromString(@"choosePhoto") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
//            chooseGetPhotoType = JCChooseGetPhotoPhotosType;
//            [weakSelf xiangCe];
//            [weakSelf.customChooseView dissmiss];
//            if (weakSelf.chooseGetPhotoWayOfAct) {
//                weakSelf.chooseGetPhotoWayOfAct(chooseGetPhotoType);
//            }
//        } error:NULL];
//
//        [self.customChooseView aspect_hookSelector:NSSelectorFromString(@"cencleChoose") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
//            [weakSelf.customChooseView dissmiss];
//            if (weakSelf.chooseGetPhotoWayOfAct) {
//                weakSelf.chooseGetPhotoWayOfAct(chooseGetPhotoType);
//            }
//        } error:NULL];
//    }
}

- (void)starToChooseThePhoneWithCurrentVC:(UIViewController *)currentVC
                                     type:(JCChoosePhoneManagerSetType)type {
    self.currentVC = currentVC;
    self.type      = type;
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    if (self.chooseViewType == JCChooseSystemViewType) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从手机相册选择", nil];
        [sheet showInView:[UIApplication sharedApplication].windows[0]];
    } else {
        
//        UIView <JCCustomChooseProtocol>   *customChooseView = [((AppDelegate *) [UIApplication sharedApplication].delegate).window viewWithTag:777];
//        if (customChooseView) {
//            [customChooseView removeFromSuperview];
//            customChooseView = nil;
//        }
//        [((AppDelegate *) [UIApplication sharedApplication].delegate).window addSubview:self.customChooseView];
//        self.customChooseView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//        self.customChooseView.tag = 777;
//        [self.customChooseView show];
    }
}

- (void)getPhoneForCameraWithCurrentVC:(UIViewController *)currentVC {
    
    self.currentVC = currentVC;
    [self paiZhao];
}

- (void)getPhoneForPhotosWithCurrentVC:(UIViewController *)currentVC {
    
    self.currentVC = currentVC;
    [self xiangCe];
}

- (void)cleanTheChoosePhoneArray {
    
    [self.chooseImagesArray removeAllObjects];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    JCChooseGetPhotoType chooseGetPhotoType = JCChooseGetPhotoCancelType;
    if (buttonIndex == 0) {
        chooseGetPhotoType = JCChooseGetPhotoCameraType;
        [self paiZhao];
    } else if (buttonIndex == 1) {
        chooseGetPhotoType = JCChooseGetPhotoPhotosType;
        [self xiangCe];
    }
    
    if (self.chooseGetPhotoWayOfAct) {
        self.chooseGetPhotoWayOfAct(chooseGetPhotoType);
    }
}

- (void)paiZhao {
    
//    if ([self isPhotoLibraryAvailable]) {
//        [self goToTheCamera];
//    }
}

- (void)goToTheCamera {
    
//    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
//    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
//    if ([self isFrontCameraAvailable]) {
//        controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
//    }
//    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
//    [mediaTypes addObject:(__bridge NSString *) kUTTypeImage];
//    controller.mediaTypes = mediaTypes;
//    controller.delegate = self;
//    [self.currentVC presentViewController:controller
//                       animated:YES
//                     completion:^(void) {
//                         NSLog(@"Picker View Controller is presented");
//                     }];
}

- (void)xiangCe {
    
//    // 相册
//    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0&&[[[UIDevice currentDevice] systemVersion] floatValue]<8.0? YES : NO)) {
//        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//        if (authStatus != AVAuthorizationStatusAuthorized) {
//            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"无法使用相机" message:@"请在iPhone的\"设置-隐私-相机\"中允许访问相机" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
//            [alertView show];
//            return;
//        }
//    }
//
//    if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
//        [self goToPhoto];
//    }
}

- (void)goToPhoto {
    
//    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
//    controller.navigationController.delegate = self;
//    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
//    controller.mediaTypes = mediaTypes;
//    controller.delegate = self;
//    [self.currentVC presentViewController:controller
//                                            animated:YES
//                                          completion:^(void) {
//
//                                          }];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    __weak typeof(self)  weakSelf   = self;
    UIImage *img = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    if (self.chooseViewType == JCChooseCustomViewType) {
        [self.customChooseView dissmiss];
    }
    
//    [picker dismissViewControllerAnimated:YES completion:^{
//        if (weakSelf.type == JCChoosePhoneNoOptimizeNoVPImageType)
//        {
//            if (weakSelf.chooseImage) {
//                weakSelf.chooseImage(img);
//            }
//            [weakSelf.chooseImagesArray addObject:img];
//        } else if (weakSelf.type == JCChoosePhoneNoOptimizeHaveVPImageType) {
//            JCVPImageCropperViewController *imgEditorVC = [[JCVPImageCropperViewController alloc] initWithImage:img cropFrame:CGRectMake(0, 100.0f, weakSelf.currentVC.view.frame.size.width, weakSelf.currentVC.view.frame.size.width) limitScaleRatio:3.0];
//            imgEditorVC.delegate = weakSelf;
//            imgEditorVC.SourceType=picker.sourceType;
//            [weakSelf.currentVC presentViewController:imgEditorVC animated:YES completion:^{
//            }];
//        } else if (weakSelf.type == JCChoosePhoneHaveOptimizeNoVPImageType) {
//            if (weakSelf.chooseImage) {
//                weakSelf.chooseImage([weakSelf imageByScalingToMaxSize:img]);
//            }
//            [weakSelf.chooseImagesArray addObject:[weakSelf imageByScalingToMaxSize:img]];
//        } else {
//            JCVPImageCropperViewController *imgEditorVC = [[JCVPImageCropperViewController alloc] initWithImage:[weakSelf imageByScalingToMaxSize:img] cropFrame:CGRectMake(0, 100.0f, weakSelf.currentVC.view.frame.size.width, weakSelf.currentVC.view.frame.size.width) limitScaleRatio:3.0];
//            imgEditorVC.delegate = weakSelf;
//            imgEditorVC.SourceType=picker.sourceType;
//            [weakSelf.currentVC presentViewController:imgEditorVC animated:YES completion:^{
//                // TO DO
//            }];
//        }
//    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    if (self.cancelChooseImage) {
        self.cancelChooseImage();
    }
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}

// VPImageCropperDelegate
//- (void)imageCropper:(JCVPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
//
//    if (self.chooseImage) {
//        self.chooseImage(editedImage);
//    }
//    [cropperViewController dismissViewControllerAnimated:YES completion:^{
//    }];
//}
//
//- (void)imageCropperDidCancel:(JCVPImageCropperViewController *)cropperViewController {
//
//    [cropperViewController dismissViewControllerAnimated:YES completion:^{
//    }];
//}


#pragma mark camera utility

- (BOOL)isCameraAvailable {
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL)isRearCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL)isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

//- (BOOL)doesCameraSupportTakingPhotos {
//    return [self cameraSupportsMedia:(__bridge NSString *) kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
//}
//
//- (BOOL) isPhotoLibraryAvailable{
//    return [UIImagePickerController isSourceTypeAvailable:
//            UIImagePickerControllerSourceTypePhotoLibrary];
//}
//
//- (BOOL)canUserPickVideosFromPhotoLibrary {
//    return [self
//            cameraSupportsMedia:(__bridge NSString *) kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//}
//
//- (BOOL)canUserPickPhotosFromPhotoLibrary {
//    return [self
//            cameraSupportsMedia:(__bridge NSString *) kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//}

- (BOOL)cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType {
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *) obj;
        if ([mediaType isEqualToString:paramMediaType]) {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}

// image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        //        NSLog(@"could not scale image");
        
        //pop the context to get back to the default
        UIGraphicsEndImageContext();
    return newImage;
}

@end
