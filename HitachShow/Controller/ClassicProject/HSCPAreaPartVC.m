//
//  HSCPAreaPartVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPAreaPartVC.h"
#import "HSProjectView.h"

@interface HSCPAreaPartVC ()

@end

@implementation HSCPAreaPartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
}

- (void)addSubviews {
    // Background
    UIImageView *bg = [[UIImageView alloc] initWithImage:_background];
    bg.backgroundColor = [UIColor grayColor];
    [self.view addSubview:bg];
    [bg makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // Title
    UILabel *area = [[UILabel alloc] init];
    [self.view addSubview:area];
    area.text = _areaName;
    area.font = [UIFont systemFontOfSize:36];
    area.textColor = [UIColor blackColor];
    [area makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(330, 48));
        make.top.equalTo(self.view.top).offset(55);
        make.left.equalTo(self.view.left).offset(121);
    }];
    
    
    CGFloat width = 190;//178
    CGFloat height = width * 0.93;
    CGFloat spacingUPDown = 9;
    // Scrollview
    CGFloat spacing = (AppWidth - 5*4 - width*5)/2;
    UIScrollView *projectPanel = [[UIScrollView alloc] init];
    [self.view addSubview:projectPanel];
    [projectPanel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(310);
        make.left.equalTo(self.view.left).offset(spacing);
        make.right.equalTo(self.view.right).offset(-spacing + 10);
        make.height.equalTo((height+spacingUPDown) * 2);
    }];
//    projectPanel.backgroundColor = [UIColor blackColor];
    
    // Project list
    NSInteger count = _projects.count;
    NSInteger n = count - 13;
    if (n > 0) {
        n = 2 + (n%5==0?n/5:(n/5+1));
        projectPanel.contentSize = CGSizeMake(AppWidth - spacing*2,(height+spacingUPDown) * n);
        projectPanel.scrollEnabled = YES;
        projectPanel.showsVerticalScrollIndicator = YES;
        projectPanel.userInteractionEnabled = YES;
        [projectPanel flashScrollIndicators];
    }
    
    for (int i=0; i<count; i++) {
        
        HSProjectView *pv = [[HSProjectView alloc] init];
        if (i > 2) {
            [projectPanel addSubview:pv];
            [pv makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(projectPanel.top).offset((height + spacingUPDown) * ((i -3)/5));
                make.left.equalTo(projectPanel.left).offset((width + 5)*((i-3)%5));
                make.size.equalTo(CGSizeMake(width, height));
            }];
        } else {
            [self.view addSubview:pv];
            [pv makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(CGSizeMake(width, height));
                make.left.equalTo(self.view.left).offset(spacing + (width + 5)*i);
                make.top.equalTo(self.view.top).offset(122);
            }];
        }
        
        pv.project = _projects[i];
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
