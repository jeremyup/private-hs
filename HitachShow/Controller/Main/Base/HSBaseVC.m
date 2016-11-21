//
//  HSBaseViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSBaseVC.h"

@interface HSBaseVC ()

@end

@implementation HSBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Hide status bar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void) resetTabBarWidth:(CGFloat) width {
    UITabBar *bar = nil;
    if (self.navigationController && self.navigationController.tabBarController) {
        bar = self.navigationController.tabBarController.tabBar;
    } else if (self.tabBarController){
        bar = self.tabBarController.tabBar;
    }
    if (bar) {
        CGRect frame = bar.frame;
        [bar setFrame:CGRectMake(frame.origin.x, frame.origin.y, width, frame.size.height)];
    }
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
