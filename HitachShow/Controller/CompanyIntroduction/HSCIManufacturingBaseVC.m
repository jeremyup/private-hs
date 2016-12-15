//
//  HSCIManufacturingBaseVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCIManufacturingBaseVC.h"
#import "HSCommonInfo.h"
#import "HSCIMBSubVC.h"

@interface HSCIManufacturingBaseVC ()

@property(nonatomic,strong) NSArray *introductions;

@end

@implementation HSCIManufacturingBaseVC

- (void)viewDidLoad {
    self.titleText = @"Manufacturing base";
    HSCommonInfo *commonInfo = [HSCommonInfo shared];
    // Content from DB
    _introductions = [commonInfo findByCategory:@"ci-mb"];
    
    [super viewDidLoad];
    // Manufacturing base main image
    self.mainView.layer.contents = (id)[HSResUtil imageNamed:[commonInfo findByID:@"ci-3"].picture].CGImage;
}

- (void) addSubviews {
    [super addSubviews];
    
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
            make.size.equalTo(CGSizeMake(160, 33));
            make.top.equalTo(self.optView.top).offset(17 + 50 * i);
        }];
    }
}

-(void) click:(UIButton *) sender {
    HSCIMBSubVC *subVC = [[HSCIMBSubVC alloc] init];
    subVC.introductions = _introductions;
    subVC.selectedIndex = sender.tag;
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
