//
//  HSBaseTopLogoVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSBaseTopLogoVC.h"

@interface HSBaseTopLogoVC ()

@end

@implementation HSBaseTopLogoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLogo];
    [self resetTabBarWidth:AppWidth];
}

- (void) addLogo {
    UIImageView *logoView = [[UIImageView alloc] init];
    [self.view addSubview:logoView];
    logoView.backgroundColor = [UIColor whiteColor];
    [logoView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(155);
        make.height.equalTo(134);
        make.left.equalTo(self.view.left).offset(89);
        make.top.equalTo(self.view.top);
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
