//
//  HSCPTabBar.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPAreaTabBar.h"
#import "HSViewUtil.h"
#import "HSCPMainVC.h"
#import "HSCPTabVC.h"

@implementation HSCPAreaTabBar

- (void) layoutSubviews {
    [super layoutSubviews];
    [self addModuleTop];
}

- (void) addButtons {
    int i = 0;
    CGFloat x = 195;
    CGFloat width = (AppWidth - x - 250 - 113)/4;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
            CGRect frame = CGRectMake(x, (self.bounds.size.height - 40)/2, width, 40);
            UIButton *tabBtn = [self customBtnWithTitle:self.titles[i] frame:frame];
            tabBtn.tag = i;
            [tabBtn addTarget:self action:@selector(tabClick:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:tabBtn];
            x+=width;
            i++;
        }
    }
    [self addTypeButton];
}

- (void) addTypeButton {
    CGRect frame = CGRectMake(AppWidth - 240 - 110, (self.bounds.size.height - 40)/2, 90, 40);
    UIButton *moduleTopBtn = [self customBtnWithTitle:@"Building Type" frame:frame];
    moduleTopBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:0.6];
    [self addSubview:moduleTopBtn];
    [moduleTopBtn addTarget:self action:@selector(typeClick) forControlEvents:UIControlEventTouchDown];
}

- (void) typeClick {
    UIViewController *currentVC = [HSViewUtil findViewController:self];
    HSCPTabVC *tabVC = [[HSCPTabVC alloc] init];
    tabVC.selectedIndex = 1;
    [currentVC presentViewController:tabVC animated:YES completion:nil];
}

- (void) addModuleTop {
    // TOP size=80*40, spacing=7 btnSpacing=3
    CGRect frame = CGRectMake(70, (self.bounds.size.height - 40)/2, 120, 40);
    UIButton *moduleTopBtn = [self customBtnWithTitle:@"PROJECT GALLERY TOP" frame:frame];
    moduleTopBtn.titleLabel.font = [UIFont systemFontOfSize:12 weight:0.6];
    [self addSubview:moduleTopBtn];
    [moduleTopBtn addTarget:self action:@selector(moduleTopClick) forControlEvents:UIControlEventTouchDown];
}

-(void) moduleTopClick {
    UIViewController *currentVC = [HSViewUtil findViewController:self];
    HSCPMainVC *cpMainVC = [[HSCPMainVC alloc] init];
    [currentVC presentViewController:cpMainVC animated:YES completion:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
