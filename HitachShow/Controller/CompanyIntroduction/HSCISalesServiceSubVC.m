//
//  HSCISalesServiceVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCISalesServiceSubVC.h"
#import "HSCommonInfo.h"

@interface HSCISalesServiceSubVC ()

@end

@implementation HSCISalesServiceSubVC

- (void)viewDidLoad {
    self.titleText = @"Sales/Service Stations";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) addSubviews {
    [super addSubviews];
    
    // TODO
    self.mainView.layer.contents = (id)[UIImage imageNamed:_image].CGImage;
    
    // Buttons
    NSInteger count = _infos.count;
    count = count > 10 ? 10 : count;
    for (int i=0;i<count;i++) {
        UIButton *btn = [[UIButton alloc] init];
        [self.optView addSubview:btn];
        HSCommonInfo *info = _infos[i];
        [btn setTitle:info.name forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn setTitleColor:HS_COLOR_BTN_BORDER_HSCICompanyProfileVC forState:UIControlStateNormal];
        btn.tag = i;
        btn.backgroundColor = [UIColor blackColor];
        btn.layer.borderWidth = 1.5;
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.optView.centerX);
            make.size.equalTo(CGSizeMake(160, 33));
            make.top.equalTo(self.optView.top).offset(8 + 40 * i);
        }];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void) click:(UIButton *) sender {
    for (UIButton *btn in self.optView.subviews) {
        if (btn.tag == sender.tag) {
            btn.layer.borderColor = HS_COLOR_BTN_BORDER_HSCICompanyProfileVC.CGColor;
        } else {
            btn.layer.borderColor = [UIColor blackColor].CGColor;
        }
    }
    
    HSCommonInfo *subInfo = _infos[sender.tag];
    self.subTitle = subInfo.title;
    self.mainView.layer.contents = (id)[ UIImage imageNamed:subInfo.picture].CGImage;
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
