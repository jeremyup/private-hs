//
//  HSPIMainViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSPITabVC.h"
#import "HSPIBaseVC.h"

@interface HSPITabVC ()

@end

@implementation HSPITabVC

- (void)viewDidLoad {
    self.titles = [NSArray arrayWithObjects:@"Elevator",
                   @"Escalator",nil ];
    [super viewDidLoad];
    
    [self setChildVC];
}

- (void)setChildVC {
    NSDictionary *map = @{@"Elevator":@"HSPIElevatorVC",
                          @"Escalator":@"HSPIEscalatorVC"};
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    for (NSString *key in self.titles) {
        NSString *vcName = map[key];
        HSPIBaseVC *vc = [[NSClassFromString(vcName) alloc] init];
        [vcs addObject:vc];
    }
    
    self.viewControllers = vcs;
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
