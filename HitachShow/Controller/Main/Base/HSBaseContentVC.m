//
//  HSBaseContentVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSBaseContentVC.h"
#import "HSLabel.h"

@interface HSBaseContentVC ()

@property(nonatomic,strong) HSLabel *subTitleLabel;

@end

@implementation HSBaseContentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self addSubviews];
}

- (void) addSubviews {
    // Title label
    HSLabel *titleLabel = [[HSLabel alloc] init];
    [self.view addSubview:titleLabel];
    titleLabel.text = _titleText;
    titleLabel.backgroundColor = HS_COLOR_LAB_BG_HSCICompanyProfileVC;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:22 weight:0.5];
    titleLabel.textInsets = UIEdgeInsetsMake(-150, 50, 0, 50);
    [titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top);
        make.right.equalTo(self.view.right);
        make.width.equalTo(236);
        make.height.equalTo(236);
    }];
    
    // Sub title
    _subTitleLabel = [[HSLabel alloc] init];
    [titleLabel addSubview:_subTitleLabel];
    _subTitleLabel.textAlignment = NSTextAlignmentCenter;
    _subTitleLabel.textColor = [UIColor whiteColor];
    _subTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _subTitleLabel.numberOfLines = 0;
    _subTitleLabel.font = [UIFont systemFontOfSize:20 weight:0.5];
    [_subTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.left).offset(70);
        make.bottom.equalTo(titleLabel.bottom).offset(-60);
        make.size.equalTo(CGSizeMake(90, 70));
    }];
    
    // Bottom border
    UILabel *border = [[UILabel alloc] init];
    [self.view addSubview:border];
    border.backgroundColor = [UIColor grayColor];
    [border makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(1);
        make.width.equalTo(titleLabel.width);
        make.bottom.equalTo(titleLabel.bottom);
        make.left.equalTo(titleLabel.left);
    }];
    
    // Operation view needs custom
    _optView = [[UIView alloc] init];
    [self.view addSubview:_optView];
    _optView.backgroundColor = HS_COLOR_VIEW_BG_HSCICompanyProfileVC;
    [_optView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.left);
        make.right.equalTo(titleLabel.right);
        make.top.equalTo(border.bottom);
        make.bottom.equalTo(self.view.bottom).offset(-124);
    }];

    // Left main view needs custom
    _mainView = [[UIView alloc] init];
    [self.view addSubview:_mainView];
//    _mainView.backgroundColor = [UIColor grayColor];
    [_mainView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.left);
        make.top.equalTo(self.view.top);
        make.right.equalTo(titleLabel.left);
        make.bottom.equalTo(self.view.bottom).offset(-49);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setSubTitle:(NSString *)subTitle {
    _subTitleLabel.text = subTitle;
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
