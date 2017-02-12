//
//  HSMainTabBar.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSTabBar : UITabBar

@property(strong,nonatomic) NSArray *titles;

- (void) tabClick:(UIButton *) sender;

- (void) setSelectedIndex:(NSInteger) selectedIndex;

- (UIButton *) customBtnWithTitle:(NSString *) title frame:(CGRect) frame;

- (void) addButtons;

@end
