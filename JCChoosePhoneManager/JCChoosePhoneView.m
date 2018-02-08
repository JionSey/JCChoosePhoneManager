
#import "JCChoosePhoneView.h"

//VC

//View

//Model

//Other
#import "Masonry.h"

@interface JCChoosePhoneView ()

// UI
@property (nonatomic, strong) UIView *bgView;

// Data
@property (nonatomic, strong) NSArray *itemArray;

@end

@implementation JCChoosePhoneView

#pragma mark - Init Method

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self initData];
        [self lazyCreateUI];
        [self layoutSubview];
        
        [self configTheUIWithArray:self.itemArray];
    }
    return self;
}

#pragma mark - InitData

- (void)initData {
    
    self.itemArray = @[@"无优化图片并不选择使用VPImage",
                       @"无优化图片并选择使用VPImage",
                       @"优化图片并不选择使用VPImage",
                       @"优化图片并选择使用VPImage"];
}

#pragma mark - LazyCreateUI

- (void)lazyCreateUI {
    
    [self addSubview:self.bgView];
    [_bgView addSubview:self.chooseImageView];
}

#pragma mark - LayoutSubview

- (void)layoutSubview {
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsZero);
    }];
    
    [_chooseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(240, 240));
        make.centerX.equalTo(_bgView);
        make.bottom.equalTo(_bgView).offset(-30);
    }];
}

#pragma mark - Config Data

#pragma mark - System Delegate

#pragma mark - Custom Delegate

#pragma mark - Event Response

- (void)btnClicked:(UIButton *)btn {
    if (self.choosePhoneViewBtnClick) {
        self.choosePhoneViewBtnClick(btn.tag - 123);
    }
}

#pragma mark - NSNotificationCenter Method

#pragma mark - other Match

- (void)configTheUIWithArray:(NSArray *)array {

    [array enumerateObjectsUsingBlock:^(NSString *btnTitle, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor blueColor];
        [btn setTitle:btnTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = 123 + idx;
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_bgView);
            make.left.equalTo(_bgView).mas_equalTo(50);
            make.height.mas_equalTo(60);
            if (idx == 0) {
                make.top.equalTo(_bgView).mas_equalTo(30);
            }else{
                UIButton *oldBtn = [_bgView viewWithTag:123 + idx - 1];
                make.top.equalTo(oldBtn.mas_bottom).offset(30);
            }
        }];
    }];
}

#pragma mark - Getters & Setters

- (UIView *)bgView{
    if (!_bgView){
        _bgView = [UIView new];
    }
    return _bgView;
}

- (UIImageView *)chooseImageView{
    if (!_chooseImageView) {
        _chooseImageView = [[UIImageView alloc]init];
        _chooseImageView.contentMode = UIViewContentModeScaleAspectFill;
        _chooseImageView.layer.borderColor = [UIColor redColor].CGColor;
        _chooseImageView.layer.borderWidth = 1.f;
        _chooseImageView.layer.cornerRadius = 10;
        _chooseImageView.clipsToBounds = YES;
    }
    return _chooseImageView;
}

@end
