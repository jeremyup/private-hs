//
//  HSTabBarController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSTabBarController.h"
#import "HSTabBar.h"

@interface HSTabBarController ()

@property(nonatomic,strong) HSTabBar *customBar;

@end

@implementation HSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _customBar = [[HSTabBar alloc] initWithFrame:self.tabBar.frame];
    _customBar.titles = _titles;
    [self setValue:_customBar forKeyPath:@"tabBar"];
    [UITabBar appearance].translucent = YES;
    [UITabBar appearance].barStyle = UIBarStyleBlack;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    HSTabBar *tb = (HSTabBar *)self.tabBar;
    [tb setSelectedIndex:0];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
