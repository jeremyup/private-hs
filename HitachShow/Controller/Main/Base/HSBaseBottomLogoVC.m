//
//  HSBaseBottomLogoVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSBaseBottomLogoVC.h"

@interface HSBaseBottomLogoVC ()

@end

@implementation HSBaseBottomLogoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLogo];
    [self resetTabBarWidth:AppWidth - 250];
}

- (void) addLogo {
    // Logo
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png" ]];
    [self.view addSubview:logo];
    [logo makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(120, 35));
        make.right.equalTo(self.view.right).offset(-56);
        make.bottom.equalTo(self.view.bottom).offset(-41);
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
