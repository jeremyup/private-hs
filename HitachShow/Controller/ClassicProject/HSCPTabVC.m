//
//  HSCPTabVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPTabVC.h"
#import "HSBaseVC.h"

@interface HSCPTabVC ()

@property(nonatomic,strong) NSDictionary *map;

@end

@implementation HSCPTabVC

- (void)viewDidLoad {
    _map = @{@"Area":@"HSCPAreaVC",
             @"Building Type":@"HSCPTypeVC"};
    self.titles = _map.allKeys;
    [super viewDidLoad];
    
    [self setChildVC];
}

- (void)setChildVC {
    NSMutableArray *vcs = [[NSMutableArray alloc] init];
    for (NSString *key in self.titles) {
        NSString *vcName = _map[key];
        HSBaseVC *vc = [[NSClassFromString(vcName) alloc] init];
        [vcs addObject:vc];
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
