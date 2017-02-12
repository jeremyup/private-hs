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
#import "HSMainVC.h"

@implementation HSTabBar

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self addButtons];
    [self addTopButton];
}

- (void) addButtons {
    int i = 0;
    CGFloat x = 74;
    CGFloat width = (AppWidth - x - 7)/7;
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
}

- (void) setSelectedIndex:(NSInteger) selectedIndex {
    NSLog(@"-----%ld",self.subviews.count);
    for (UIView *v in self.subviews) {
        if ([v isKindOfClass:NSClassFromString(@"UIButton")]) {
            UIButton *btn = (UIButton *)v;
            if (btn.tag == selectedIndex) {
                [btn setBackgroundColor:[UIColor whiteColor]];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            } else {
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [btn setBackgroundColor:[UIColor clearColor]];
            }
        }
    }
}

- (void) tabClick:(UIButton *) sender {
    [self setSelectedIndex:sender.tag];
    UIViewController *currentVC = [HSViewUtil findViewController:self];
    if ([currentVC isKindOfClass:[UITabBarController class]]) {
        if (![sender.titleLabel.text isEqualToString:@"Product Introduction"]) {
            UITabBarController *tab = (UITabBarController *) currentVC;
            [tab setSelectedIndex:sender.tag];
        } else {
            // Production introduction do not like other tab page,need create new view
            HSPITabVC *piTab = [[HSPITabVC alloc] init];
            piTab.selectedIndex = 0;
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
    // Diff others
    btn.tag = -1;
    
    return btn;
}

- (void) addTopButton {
    CGRect frame = CGRectMake(7, (self.bounds.size.height - 40)/2, 60, 40);
    UIButton *topBtn = [self customBtnWithTitle:@"TOP" frame:frame];
    [self addSubview:topBtn];
    [topBtn addTarget:self action:@selector(topClick) forControlEvents:UIControlEventTouchDown];
}

- (void) topClick {
    UIViewController *currentVC = [HSViewUtil findViewController:self];
    HSMainVC *mainVC = [[HSMainVC alloc] init];
    [currentVC presentViewController:mainVC animated:YES completion:nil];
}

@end
