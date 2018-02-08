
#import <UIKit/UIKit.h>

typedef void (^JCChoosePhoneViewBtnClick)(NSInteger index);

@interface JCChoosePhoneView: UIView

@property (nonatomic, strong) UIImageView *chooseImageView;
@property (nonatomic, strong) JCChoosePhoneViewBtnClick choosePhoneViewBtnClick;

@end
