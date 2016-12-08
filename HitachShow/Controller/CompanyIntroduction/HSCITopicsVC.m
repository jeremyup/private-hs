//
//  HSCITopicsVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCITopicsVC.h"
#import "HSCommonInfo.h"

@interface HSCITopicsVC ()

@end

@implementation HSCITopicsVC

- (void)viewDidLoad {
    self.mainTitle = @"Topics";
    
    HSCommonInfo *commonInfo = [HSCommonInfo shared];
    // Content from DB
    self.videoList = [commonInfo findByCategory:@"ci-ts"];
    
    [super viewDidLoad];
    self.view.layer.contents = (id) [UIImage imageNamed:@"ci_topics_bg.jpg"].CGImage;
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
