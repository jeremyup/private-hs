//
//  HSMainViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSMainVC.h"
#import "HSMainTabController.h"
#import "HSPITabVC.h"


@interface HSMainVC ()

@end

@implementation HSMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self addSubViews];
}

- (void) addSubViews {
    // LOGO
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo.png" ]];
    [self.view addSubview:logoView];
    [logoView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(123.5);
        make.height.equalTo(35.5);
        make.left.equalTo(self.view.left).offset(17);
        make.top.equalTo(self.view.top).offset(30);
    }];
    
    
    // Four module
    CGFloat btnWidth = 180.5;
    CGFloat btnHeight = 338.0;
    CGFloat btnOffset = 100.0;
    CGFloat spacing = (AppWidth - btnOffset * 2) / 4;
    for (int i = 0;i < 4;i++) {
        UIButton *btn = [[UIButton alloc] init];
        [self.view addSubview:btn];
        btn.layer.borderWidth = 1;
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(btnWidth);
            make.height.equalTo(btnHeight);
            make.centerY.equalTo(self.view.centerY);
            make.left.equalTo(self.view.left).offset(btnOffset + spacing * i);
        }];
        [btn addTarget:self action:@selector(presentVC:) forControlEvents:UIControlEventTouchDown];
        btn.tag = i;
    }
}

- (void) presentVC:(UIButton *) sender {
    NSInteger index = [sender tag];
    HSMainTabController *mainTabVC = [[HSMainTabController alloc] init];
    if (index !=2) {
        mainTabVC.selectedIndex = index;
        [self presentViewController:mainTabVC animated:YES completion:nil];
    } else {
        // Production introduction do not like other tab page,need create new view
        HSPITabVC *piTab = [[HSPITabVC alloc] init];
        [self presentViewController:piTab animated:YES completion:nil];
    }
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
