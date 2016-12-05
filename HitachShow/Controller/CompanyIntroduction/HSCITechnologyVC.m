//
//  HSCITechnologyVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCITechnologyVC.h"
#import "HSDisplayInfo.h"

@interface HSCITechnologyVC ()

@end

@implementation HSCITechnologyVC

- (void)viewDidLoad {
    self.mainTitle = @"Technology";
    
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:2];
    for (int i=0; i<2; i++) {
        HSDisplayInfo *info = [[HSDisplayInfo alloc] init];
        info.videoPath = [[NSBundle mainBundle] pathForResource:@"duihua" ofType:@"mp4"];
        [list addObject:info];
    }
    self.videoList = list;
    
    [super viewDidLoad];
    self.view.layer.contents = (id) [UIImage imageNamed:@"common_bg.jpg"].CGImage;
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
