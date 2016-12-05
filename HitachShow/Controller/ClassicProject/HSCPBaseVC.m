//
//  HSCPBaseVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPBaseVC.h"

@interface HSCPBaseVC ()

@end

@implementation HSCPBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_mainTitle) {
        _mainTitle = @"Project Gallery";
    }
    
    // title
    UILabel *title = [[UILabel alloc] init];
    [self.view addSubview:title];
    title.text = _mainTitle;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:30];
    title.textColor = [UIColor whiteColor];
    [title sizeToFit];
    [title makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(177);
        make.centerX.equalTo(self.view.centerX);
    }];
    
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
