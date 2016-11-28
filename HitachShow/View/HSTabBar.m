//
//  HSMainTabBar.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSTabBar.h"
#import "HSViewUtil.h"
#import "HSPITabVC.h"

@implementation HSTabBar

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titles = [NSArray arrayWithObjects:nil];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    int i = 0;
    CGFloat x = 95;
    CGFloat width = (AppWidth - x - 240)/7;
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
            CGRect frame = CGRectMake(x, (self.bounds.size.height - 40)/2, width, 40);
            UIButton *tabBtn = [self customBtnWithTitle:_titles[i] frame:frame];
            tabBtn.tag = i;
            [tabBtn addTarget:self action:@selector(tabClick:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:tabBtn];
            x+=width;
            i++;
        }
    }
    [self addTopButton];
}

- (void) tabClick:(UIButton *) sender {
    UIViewController *currentVC = [HSViewUtil findViewController:self];
    if ([currentVC isKindOfClass:[UITabBarController class]]) {
        if (![sender.titleLabel.text isEqualToString:@"Product Introduction"]) {
            UITabBarController *tab = (UITabBarController *) currentVC;
            [tab setSelectedIndex:sender.tag];
        } else {
            // Production introduction do not like other tab page,need create new view
            HSPITabVC *piTab = [[HSPITabVC alloc] init];
            [currentVC presentViewController:piTab animated:YES completion:nil];
        }
    }
}

- (UIButton *) customBtnWithTitle:(NSString *) title frame:(CGRect) frame{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.titleLabel.font = [UIFont systemFontOfSize:13 weight:0.5];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = HS_COLOR_TAB_BORDER_HSMainTab.CGColor;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines = 0;
    btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    return btn;
}

- (void) addTopButton {
    CGRect frame = CGRectMake(7, (self.bounds.size.height - 40)/2, 80, 40);
    UIButton *topBtn = [self customBtnWithTitle:@"TOP" frame:frame];
    [self addSubview:topBtn];
    [topBtn addTarget:self action:@selector(topClick) forControlEvents:UIControlEventTouchDown];
}

- (void) topClick {
    UIViewController *currentVC = [HSViewUtil findViewController:self];
    [currentVC dismissViewControllerAnimated:YES completion:nil];
}

@end
