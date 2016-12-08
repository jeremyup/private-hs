//
//  HSPIElevatorVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSPIElevatorVC.h"

@interface HSPIElevatorVC ()

@end

@implementation HSPIElevatorVC

- (void)viewDidLoad {
    self.topTitle = @"Product Introduction [Elevator]";
    self.products = [[HSCommonInfo shared] findByCategory:@"ci-pi-el"];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
