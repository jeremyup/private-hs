//
//  HSCPProjectVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPProjectVC.h"
#import "HSLabel.h"

@interface HSCPProjectVC ()

@end

@implementation HSCPProjectVC

- (void)viewDidLoad {
    self.titleText = @"Project Gallery";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) addSubviews {
    [super addSubviews];
    
    // Country label
    HSLabel *countryLabel = [[HSLabel alloc] init];
    [self.view addSubview:countryLabel];
    countryLabel.text = _project.country;
    countryLabel.textColor = [UIColor whiteColor];
    countryLabel.font = [UIFont systemFontOfSize:24 weight:0.5];
    countryLabel.textAlignment = NSTextAlignmentCenter;
    [countryLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.optView.left);
        make.right.equalTo(self.optView.right);
        make.top.equalTo(self.optView.top).offset(33);
        make.height.equalTo(33);
    }];
    
    // Building use label
    HSLabel *useLabel = [[HSLabel alloc] init];
    [self.view addSubview:useLabel];
    useLabel.text = _project.use;
    useLabel.textColor = [UIColor whiteColor];
    useLabel.font = [UIFont systemFontOfSize:24 weight:0.5];
    useLabel.textAlignment = NSTextAlignmentCenter;
    [useLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.optView.left);
        make.right.equalTo(self.optView.right);
        make.top.equalTo(self.optView.top).offset(88);
        make.height.equalTo(33);
    }];
    
    // Project image
    UIImageView *projectImage = [[UIImageView alloc] init];
    [self.view addSubview:projectImage];
    projectImage.image = [UIImage imageNamed: _project.image];
    [projectImage makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mainView.centerY);
        make.size.equalTo(CGSizeMake(530, 403));
        make.top.equalTo(self.mainView.top).offset(35);
    }];
    projectImage.backgroundColor = [UIColor whiteColor];
    
    //
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
