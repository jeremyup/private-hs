//
//  HSImageButton.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSImageButton.h"
#import "AppDelegate.h"
#import "HSTabBarController.h"

@interface HSImageButton ()

@end

@implementation HSImageButton

+(HSImageButton *) initWithTitle:(NSString *) leftTitle rightImage:(NSString *) rightImage targetVCName:(NSString *) targetVCName {
    HSImageButton *instance = [[HSImageButton alloc] init];
    instance.leftTitle = leftTitle;
    instance.rightImage = rightImage;
    instance.targetVCName = targetVCName;
    
    return instance;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _leftBtn = [[UIButton alloc] init];
        [self addSubview:_leftBtn];
        _rightImgV = [[UIButton alloc] init];
        [self addSubview:_rightImgV];
    }
    return self;
}

- (void)layoutSubviews {
    // Super method
    [super layoutSubviews];
    
    _leftBtn.layer.borderWidth = 0.5;
    _leftBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _leftBtn.backgroundColor = HS_COLOR_BTN_BG_HSImageButton;
    [_leftBtn setTitle:_leftTitle forState:UIControlStateNormal];
    _leftBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    _leftBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_leftBtn makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, self.frame.size.width/2));
    }];
    
    _rightImgV.layer.borderWidth = 0.5;
    _rightImgV.layer.borderColor = [UIColor whiteColor].CGColor;
    [_rightImgV setImage:[UIImage imageNamed:_rightImage ] forState:UIControlStateNormal];
    _rightImgV.backgroundColor = [UIColor blackColor];
    [_rightImgV makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, self.frame.size.width/2, 0, 0));
        
    }];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
