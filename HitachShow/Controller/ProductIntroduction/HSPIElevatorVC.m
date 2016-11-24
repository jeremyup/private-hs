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
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:2];
    for (int i=0;i<4;i++) {
        HSDisplayInfo *info = [[HSDisplayInfo alloc] init];
        info.image = @"";
        info.pdfPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"pdf"];
        info.pptPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"ppt"];
        info.videoPath = [[NSBundle mainBundle] pathForResource:@"duihua" ofType:@"mp4"];
        info.productName = @"MACHINE ROOM-LESS ELEVATOR";
        info.detail = @"UAG-SN1";
        info.remark = @"[STANDARD MODEL]";
        [array addObject:info];
    }
    self.products = array;
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
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
