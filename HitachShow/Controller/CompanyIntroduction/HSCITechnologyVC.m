//
//  HSCITechnologyVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCITechnologyVC.h"

@interface HSCITechnologyVC ()

@end

@implementation HSCITechnologyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self addSubviews];
}

- (void) addSubviews {
    // title
    UILabel *title = [[UILabel alloc] init];
    [self.view addSubview:title];
    title.text = @"Technology";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:30 weight:0.5];
    title.textColor = [UIColor whiteColor];
    [title sizeToFit];
    [title makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(110);
        make.centerX.equalTo(self.view.centerX);
    }];
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
