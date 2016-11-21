//
//  HSBaseContentVC.h
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSBaseBottomLogoVC.h"

@interface HSBaseContentVC : HSBaseBottomLogoVC

@property(nonatomic,strong) NSString *titleText;
@property(nonatomic,strong) NSString *subTitle;
@property(nonatomic,strong,readonly) UIView *mainView;
@property(nonatomic,strong,readonly) UIView *optView;

- (void) addSubviews;

@end
