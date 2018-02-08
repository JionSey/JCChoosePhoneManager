//
//  JCCustomChooseProtocol.h
//  ChoosePP
//
//  Created by Jackie on 2017/2/15.
//  Copyright © 2017年 Jockie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JCCustomChooseProtocol <NSObject>

@required

// 下列方法必须实现!!!

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

@end
