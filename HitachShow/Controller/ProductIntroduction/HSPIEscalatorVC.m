//
//  HSPIEscalatorVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSPIEscalatorVC.h"

@interface HSPIEscalatorVC ()

@end

@implementation HSPIEscalatorVC

- (void)viewDidLoad {
    self.topTitle = @"Product Introduction [Escalator]";
    self.products = [[HSCommonInfo shared] findByCategory:@"pi-es"];
    
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
