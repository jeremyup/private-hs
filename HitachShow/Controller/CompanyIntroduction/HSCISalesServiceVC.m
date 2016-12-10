//
//  HSCISalesServiceVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCISalesServiceVC.h"
#import "HSCommonInfo.h"
#import "HSCISalesServiceSubVC.h"

@interface HSCISalesServiceVC ()

@property(nonatomic,strong) NSArray *introductions;

@end

@implementation HSCISalesServiceVC

- (void)viewDidLoad {
    self.titleText = @"Sales/Service Stations";
    
    HSCommonInfo *commonInfo = [HSCommonInfo shared];
    // Content from DB
    _introductions = [commonInfo findByCategory:@"ci-ss"];
    NSInteger count = _introductions.count;
    count = count > 6 ? 6 : count;
    for (int i=0;i<count;i++) {
        HSCommonInfo *entity = _introductions[i];
        entity.subInfos = [commonInfo findByCategory:entity.ID];
    }
    [super viewDidLoad];
    self.mainView.layer.contents = (id)[UIImage imageNamed:[commonInfo findByID:@"ci-4"].picture].CGImage;
}

- (void) addSubviews {
    [super addSubviews];
    
    // Buttons
    NSInteger count = _introductions.count;
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
            make.size.equalTo(CGSizeMake(160, 33));
            make.top.equalTo(self.optView.top).offset(17 + 50 * i);
        }];
    }
}

- (void) click:(UIButton *) sender {
    HSCommonInfo *info = _introductions[sender.tag];
    HSCISalesServiceSubVC *subVC = [[HSCISalesServiceSubVC alloc] init];
    subVC.infos = info.subInfos;
    subVC.image = info.picture;
    [self.navigationController pushViewController:subVC animated:YES];
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
