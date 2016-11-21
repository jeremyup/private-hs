//
//  HSCICompanyProfileViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCICompanyProfileVC.h"
#import "HSLabel.h"
#import "HSDisplayInfo.h"

@interface HSCICompanyProfileVC ()

@property(nonatomic,strong) UIImageView *topImage;
@property(nonatomic,strong) HSLabel *introduction;
@property(nonatomic,strong) HSLabel *info;
@property(nonatomic,strong) NSMutableArray *introductions;


@end

@implementation HSCICompanyProfileVC

- (void)viewDidLoad {
    self.titleText = @"Company";
    // Dummy TODO
    _introductions = [NSMutableArray arrayWithCapacity:6];
    for (int i=0;i<6;i++) {
        HSDisplayInfo *entity = [[HSDisplayInfo alloc] init];
        entity.introduction = @"VOA Associates Incorporated is delighted to announce that we have joined Stantec. We are now part of a team that unites approximately 22,000 employees working in over 400 locations across six continents. This is an exceptional growth opportunity for us. More importantly, it offers our clients with the benefits and opportunities of working with a top ten global design firm.";
        entity.info = @"North Side\n3121 North Milwaukee Avenue\nChicago, IL 60618\n+17735885781\n\n\nNorth Side\n3121 North Milwaukee Avenue\nChicago, IL 60618\n+17735885781";
        entity.image = @"";
        entity.title = [NSString stringWithFormat:@"%d", i ];
        entity.btnText = [NSString stringWithFormat:@"%d", i ];;
        [_introductions addObject:entity];
    }
    
    [super viewDidLoad];
}

- (void) addSubviews {
    [super addSubviews];
    
    // Image text
    _topImage = [[UIImageView alloc] init];
    [self.mainView addSubview:_topImage];
    [_topImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainView.top).offset(20);
        make.left.equalTo(self.mainView.left).offset(40);
        make.right.equalTo(self.mainView.right).offset(-40);
        make.height.equalTo(400);
    }];
    
    _introduction = [[HSLabel alloc] init];
    [self.mainView addSubview:_introduction];
    _introduction.lineBreakMode = NSLineBreakByWordWrapping;
    _introduction.numberOfLines = 0;
    _introduction.textColor = [UIColor whiteColor];
    _introduction.font = [UIFont systemFontOfSize:16 weight:0.5];
    [_introduction makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topImage.bottom);
        make.left.equalTo(_topImage.left);
        make.right.equalTo(_topImage.right);
        make.height.equalTo(130);
    }];
    
    _info = [[HSLabel alloc] init];
    [self.mainView addSubview:_info];
    _info.lineBreakMode = NSLineBreakByWordWrapping;
    _info.numberOfLines = 0;
    _info.textColor = [UIColor whiteColor];
    _info.font = [UIFont systemFontOfSize:12 weight:0.5];
    _info.layer.borderWidth = 1;
    _info.textInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [_info makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_introduction.bottom);
        make.left.equalTo(_introduction.left);
        make.right.equalTo(_introduction.right);
        make.bottom.equalTo(self.mainView.bottom);
    }];
    
    // Buttons
    NSInteger count = _introductions.count;
    for (int i=0; i<count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [self.optView addSubview:btn];
        HSDisplayInfo *ci = _introductions[i];
        btn.layer.borderWidth = 1.5;
        btn.backgroundColor = [UIColor blackColor];
        [btn setTitleColor:HS_COLOR_BTN_BORDER_HSCICompanyProfileVC forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn setTitle:ci.btnText forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.optView.centerX);
            make.size.equalTo(CGSizeMake(143, 33));
            make.top.equalTo(self.optView.top).offset(17 + 50 * i);
        }];
    }
}

-(void) click:(UIButton *) sender {
    for (UIButton *btn in self.optView.subviews) {
        if (btn.tag == sender.tag) {
            btn.layer.borderColor = HS_COLOR_BTN_BORDER_HSCICompanyProfileVC.CGColor;
        } else {
            btn.layer.borderColor = [UIColor blackColor].CGColor;
        }
    }
    self.mainView.backgroundColor = [UIColor clearColor];
    HSDisplayInfo *ci = _introductions[sender.tag];
    self.subTitle = ci.title;
    _introduction.text = ci.introduction;
    _info.text = ci.info;
    _topImage.image = [UIImage imageNamed:ci.image];
    _topImage.backgroundColor = [UIColor grayColor];
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
