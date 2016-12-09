//
//  HSCPTypeTabVC.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPTypeTabVC.h"
#import "HSCommonInfo.h"
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
//    NSDictionary *categores = @{@"Mix":@"ci-cp-2-1",
//                                @"Office":@"ci-cp-2-2",
//                                @"Residence":@"ci-cp-2-3",
//                                @"Hotel":@"ci-cp-2-4",
//                                @"Shopping":@"ci-cp-2-5",
//                                @"Airport":@"ci-cp-2-6",
//                                @"Commercial":@"ci-cp-2-7",
//                                @"Others":@"ci-cp-2-8"};
    for (int i=0; i<_types.count; i++) {
        NSString *type =  _types[i];
        HSCPTypePartVC *vc = [[HSCPTypePartVC alloc] init];
        vc.typeName = type;
        vc.projects = [[HSCommonInfo shared] findByType:type];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];

        [vcs addObject:nav];
    }
    self.viewControllers = vcs;
}


@end
