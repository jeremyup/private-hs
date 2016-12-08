//
//  HSCIDevelopmentBaseVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCIDevelopmentBaseVC.h"
#import "HSLabel.h"
#import "HSCommonInfo.h"
#import "HSVideoView.h"


@interface HSCIDevelopmentBaseVC ()

@property(nonatomic,strong) UIImageView *topImage;
@property(nonatomic,strong) HSLabel *introduction;
@property(nonatomic,strong) HSVideoView *movie;
@property(nonatomic,strong) NSArray *introductions;

@end


@implementation HSCIDevelopmentBaseVC

- (void)viewDidLoad {
    self.titleText = @"Development base";
    
    HSCommonInfo *commonInfo = [HSCommonInfo shared];
    // Content from DB
    _introductions = [commonInfo findByCategory:@"ci-db"];
    
    [super viewDidLoad];
    // Development base main image
    self.mainView.layer.contents = (id)[UIImage imageNamed:[commonInfo findByID:@"ci-2"].picture].CGImage;
}

- (void) addSubviews {
    [super addSubviews];
    
    // Image text
    _topImage = [[UIImageView alloc] init];
    [self.mainView addSubview:_topImage];
    [_topImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainView.top).offset(40);
        make.left.equalTo(self.mainView.left).offset(40);
        make.right.equalTo(self.mainView.right).offset(-20);
        make.height.equalTo(500);
    }];
    
    _introduction = [[HSLabel alloc] init];
    [self.mainView addSubview:_introduction];
    _introduction.lineBreakMode = NSLineBreakByWordWrapping;
    _introduction.numberOfLines = 0;
    _introduction.textColor = [UIColor whiteColor];
    _introduction.font = [UIFont systemFontOfSize:12];
    _introduction.layer.borderColor = [UIColor whiteColor].CGColor;
    [_introduction makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topImage.bottom).offset(20);
        make.left.equalTo(_topImage.left);
        make.width.equalTo(330);
        make.height.equalTo(150);
    }];
    
    // Video thumbnail
    _movie = [[HSVideoView alloc] init];
    _movie.displayTitle = YES;
    [self.mainView addSubview:_movie];
    [_movie makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_topImage.right).offset(-50);
        make.top.equalTo(_introduction.top);
        make.bottom.equalTo(self.view.bottom).offset(-80);
        make.width.equalTo(200);
    }];
    _movie.hidden = YES;
    
    // Buttons
    NSInteger count = _introductions.count;
    count = count > 6 ? 6 : count;
    for (int i=0; i<count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [self.optView addSubview:btn];
        HSCommonInfo *ci = _introductions[i];
        btn.layer.borderWidth = 1.5;
        btn.backgroundColor = [UIColor blackColor];
        [btn setTitleColor:HS_COLOR_BTN_BORDER_HSCICompanyProfileVC forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn setTitle:ci.name forState:UIControlStateNormal];
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
    self.mainView.layer.contents = nil;
    HSCommonInfo *ci = _introductions[sender.tag];
    self.subTitle = ci.title;
    _introduction.text = ci.text1;
    _topImage.image = [UIImage imageNamed:ci.picture];

    if (ci.video != nil) {
        _movie.hidden = NO;
        NSArray *array = [ci.video componentsSeparatedByString:@"."];
        _movie.videoPath = [[NSBundle mainBundle] pathForResource:array[0] ofType:array[1]];
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
