//
//  VPImageCropperViewController.h
//  VPolor
//
//  Created by Vinson.D.Warm on 12/30/13.
//  Copyright (c) 2013 Huang Vinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JCVPImageCropperViewController;

@protocol JCVPImageCropperDelegate <NSObject>

- (void)imageCropper:(JCVPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage;
- (void)imageCropperDidCancel:(JCVPImageCropperViewController *)cropperViewController;

@end

@interface JCVPImageCropperViewController : UIViewController

@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) id<JCVPImageCropperDelegate> delegate;
@property (nonatomic, assign) CGRect cropFrame;
@property (nonatomic, assign) UIImagePickerControllerSourceType SourceType;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;

@end
