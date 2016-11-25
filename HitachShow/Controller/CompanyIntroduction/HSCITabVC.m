//
//  HSCITabVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCITabVC.h"
#import "HSBaseVC.h"

@interface HSCITabVC () <UITabBarControllerDelegate>

@end

@implementation HSCITabVC

- (void)viewDidLoad {
    self.titles = [NSArray arrayWithObjects:@"Company Profile",@"Development Base",@"Manufacturing Base",@"Sales/Service Stations",@"History",@"Technology" ,@"Topics",nil];

    [super viewDidLoad];
    self.delegate = self;
    [self setChildVC];
}

- (void)setChildVC {
    NSDictionary *map = @{@"Company Profile":@"HSCICompanyProfileVC",
                          @"Development Base":@"HSCIDevelopmentBaseVC",
                          @"Manufacturing Base":@"HSCIManufacturingBaseVC",
                          @"Sales/Service Stations":@"HSCISalesServiceVC",
                          @"History":@"HSCIHistoryVC",
                          @"Technology":@"HSCITechnologyVC",
                          @"Topics":@"HSCITopicsVC"};
    for (NSString *key in self.titles) {
        NSString *vcName = map[key];
        HSBaseVC *vc = [[NSClassFromString(vcName) alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self addChildViewController:nav];
    }
}

- (void) setSelectedIndex:(NSUInteger)selectedIndex {
    // Reset navigation to the root view on tab every time
    UINavigationController *vc = self.childViewControllers[selectedIndex];
    [vc popToRootViewControllerAnimated:YES];
    [super setSelectedIndex:selectedIndex];
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
