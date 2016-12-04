//
//  HSCPAreaTabVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPAreaTabVC.h"
#import "HSCPAreaTabBar.h"
#import "HSCPAreaPartVC.h"
#import "HSProject.h"

@interface HSCPAreaTabVC ()

@property(nonatomic,strong) NSArray *areas;

@end

@implementation HSCPAreaTabVC

- (void)viewDidLoad {
    _areas = [NSArray arrayWithObjects:@"East Asia",@"Southeast Asia",@"Southern Asia",@"West Asia\nMiddle Asia", nil];

    [super viewDidLoad];
    
    HSCPAreaTabBar *tabBar = [[HSCPAreaTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.titles = _areas;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    [self setChildVC];
}

- (void)setChildVC {
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    for (int i=0; i<_areas.count; i++) {
        NSString *area =  _areas[i];
        HSCPAreaPartVC *vc = [[HSCPAreaPartVC alloc] init];
        vc.areaName = area;
        vc.projects = [HSProject listByArea:area];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcs addObject:nav];
    }
    self.viewControllers = vcs;
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
