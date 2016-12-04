//
//  HSCPTypeTabVC.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPTypeTabVC.h"
#import "HSProject.h"
#import "HSCPTypePartVC.h"
#import "HSCPTypeTabBar.h"

@interface HSCPTypeTabVC ()

@property(nonatomic,strong) NSArray *types;

@end

@implementation HSCPTypeTabVC

- (void)viewDidLoad {
    _types = [NSArray arrayWithObjects:@"Mix",@"Office",@"Residence",
              @"Hotel",@"Shopping",@"Airport",@"Commercial",@"Others", nil];
    
    [super viewDidLoad];
    
    HSCPTypeTabBar *tabBar = [[HSCPTypeTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.titles = _types;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    [self setChildVC];
}

- (void)setChildVC {
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    for (int i=0; i<_types.count; i++) {
        NSString *type =  _types[i];
        HSCPTypePartVC *vc = [[HSCPTypePartVC alloc] init];
        vc.typeName = type;
        vc.projects = [HSProject listByArea:type];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];

        [vcs addObject:nav];
    }
    self.viewControllers = vcs;
}


@end
