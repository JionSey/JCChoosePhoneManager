
#import "JCCustomChooseView.h"

//VC

//View

//Model

//Other

@interface JCCustomChooseView ()

// UI
@property (nonatomic, strong) UIView   *bgView;     //!<背景视图
@property (nonatomic, strong) UIView   *bottomView; //!<底部背景
@property (nonatomic, strong) UIButton *cameraBtn;  //!<拍照按钮
@property (nonatomic, strong) UIButton *photoBtn;   //!<相册按钮
@property (nonatomic, strong) UIButton *cencleBtn;  //!<取消按钮


// Data
@property (nonatomic, strong) NSArray *abilityArray;

@end

@implementation JCCustomChooseView

#pragma mark - Init Method

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initData];
        [self lazyCreateUI];
        [self layoutSubview];
    }
    return self;
}

#pragma mark - InitData

- (void)initData {
    
}

#pragma mark - LazyCreateUI

- (void)lazyCreateUI {
    
    [self addSubview:self.bgView];
    [self addSubview:self.bottomView];
    [_bottomView addSubview:self.cameraBtn];
    [_bottomView addSubview:self.photoBtn];
    [_bottomView addSubview:self.cencleBtn];
}

#pragma mark - LayoutSubview

- (void)layoutSubview {
    
    _bgView.frame = self.bounds;
    _bottomView.frame = CGRectMake(0, self.frame.size.height - 154, self.frame.size.width, 154);
    _cameraBtn.frame = CGRectMake(0, 0, self.frame.size.width, 47.5);
    _photoBtn.frame = CGRectMake(0, CGRectGetMaxY(_cameraBtn.frame) + 0.5, self.frame.size.width, _cameraBtn.frame.size.height);
    _cencleBtn.frame = CGRectMake(0, _bottomView.frame.size.height - _cameraBtn.frame.size.height, self.frame.size.width, _cameraBtn.frame.size.height);
}

#pragma mark - Config Data

#pragma mark - System Delegate

#pragma mark - Custom Delegate

// 选择拍照
- (void)chooseCamera {
    NSLog(@"%s %d",__func__,__LINE__);
}

// 选择相册
- (void)choosePhoto {
    NSLog(@"%s %d",__func__,__LINE__);
}

// 取消选择
- (void)cencleChoose {
    NSLog(@"%s %d",__func__,__LINE__);
}

// 展示
- (void)show {
    NSLog(@"%s %d",__func__,__LINE__);
}

// 隐藏
- (void)dissmiss{
    NSLog(@"%s %d",__func__,__LINE__);
    
    [self removeFromSuperview];
}

#pragma mark - Event Response

#pragma mark - NSNotificationCenter Method

#pragma mark - other Match

#pragma mark - Getters & Setters

/**
 *
 *  @brief 背景视图
 *
 */
- (UIView *)bgView{
    if (!_bgView){
        _bgView = [UIView new];
        _bgView.alpha = 0.3;
        _bgView.backgroundColor = [UIColor blackColor];
    }
    return _bgView;
}
/**
 *
 *  @brief 底部背景
 *
 */
- (UIView *)bottomView{
    if (!_bottomView){
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor grayColor];
    }
    return _bottomView;
}
/**
 *
 *  @brief 拍照按钮
 *
 */
- (UIButton *)cameraBtn{
    if (!_cameraBtn){
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cameraBtn.backgroundColor = [UIColor whiteColor];
        [_cameraBtn setTitle:@"拍照" forState:UIControlStateNormal];
        [_cameraBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cameraBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _cameraBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_cameraBtn addTarget:self action:@selector(chooseCamera) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}
/**
 *
 *  @brief 相册按钮
 *
 */
- (UIButton *)photoBtn{
    if (!_photoBtn){
        _photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _photoBtn.backgroundColor = [UIColor whiteColor];
        [_photoBtn setTitle:@"从手机相册选择" forState:UIControlStateNormal];
        [_photoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _photoBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _photoBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_photoBtn addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    }
    return _photoBtn;
}
/**
 *
 *  @brief 取消按钮
 *
 */
- (UIButton *)cencleBtn{
    if (!_cencleBtn){
        _cencleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cencleBtn.backgroundColor = [UIColor whiteColor];
        [_cencleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cencleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cencleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _cencleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_cencleBtn addTarget:self action:@selector(cencleChoose) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cencleBtn;
}

@end
