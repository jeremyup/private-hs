//
//  HSCPTypePartVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPTypePartVC.h"
#import "HSProjectView.h"

@interface HSCPTypePartVC ()

@end

@implementation HSCPTypePartVC

- (void)viewDidLoad {
    self.mainTitle = _typeName;
    [super viewDidLoad];
    [self addSubviews];
}

- (void)addSubviews {
    CGFloat width = 190;
    CGFloat height = width * 0.93;
    CGFloat spacing = 5;
    
    // Product scroll panel
    UIScrollView *projectPanel = [[UIScrollView alloc] init];
    [self.view addSubview:projectPanel];
    [projectPanel makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.centerY.equalTo(self.view.centerY).offset(30);
        make.size.equalTo(CGSizeMake(width*5+spacing*4, height+5));
    }];
//    projectPanel.backgroundColor = [UIColor blackColor];
    
    
    
    NSInteger count = _projects.count;
    for (int i=0; i<count;i++) {
        HSProjectView *pv = [[HSProjectView alloc] init];
        [projectPanel addSubview:pv];
        
        [pv makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(width, height));
            make.top.equalTo(projectPanel.top);
            make.left.equalTo(projectPanel.left).offset((width+spacing)*i);
        }];
        pv.project = _projects[i];
    }
    
    if (count > 5) {
        projectPanel.contentSize = CGSizeMake((width+spacing)*count - spacing,height+5);
        projectPanel.scrollEnabled = YES;
        projectPanel.showsHorizontalScrollIndicator = YES;
        projectPanel.userInteractionEnabled = YES;
        [projectPanel flashScrollIndicators];
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
