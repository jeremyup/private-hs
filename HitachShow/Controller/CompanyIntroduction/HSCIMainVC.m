//
//  HSCIMainViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCIMainVC.h"
#import "HSImageButton.h"
#import "HSCITabVC.h"

@interface HSCIMainVC ()

@property(strong,nonatomic) NSArray *btns;
@property(strong,nonatomic) HSCITabVC *tabVC;

@end

@implementation HSCIMainVC

- (void)viewDidLoad {
    [self initData];
    [self addSubviews];
    
    [super viewDidLoad];
    self.view.layer.contents = (id)[UIImage imageNamed:@"ci_main_bg.jpg"].CGImage;
}

- (void) initData {
    _btns = [NSArray arrayWithObjects:
     [HSImageButton initWithTitle:@"Company Profile" rightImage:@"ci_main_btn_2_1_Company Profile.jpg" targetVCName:@"HSCICompanyProfileVC"],
     [HSImageButton initWithTitle:@"Development Base" rightImage:@"ci_main_btn_2_2_Developmentbase.jpg" targetVCName:@"HSCIDevelopmentBaseVC"],
     [HSImageButton initWithTitle:@"Manufacturing Base" rightImage:@"ci_main_btn_2_3_Manufacturing.jpg" targetVCName:@"HSCIManufacturingBaseVC"],
     [HSImageButton initWithTitle:@"Sales/Service Stations" rightImage:@"ci_main_btn_2_4_Sales.jpg" targetVCName:@"HSCISalesServiceVC"],
     [HSImageButton initWithTitle:@"History" rightImage:@"ci_main_btn_2_5_History.jpg" targetVCName:@"HSCIHistoryVC"],
     [HSImageButton initWithTitle:@"Technology" rightImage:@"ci_main_btn_2_6_Technology.jpg" targetVCName:@"HSCITechnologyVC"],
     [HSImageButton initWithTitle:@"Topics" rightImage:@"ci_main_btn_2_7_Topics.jpg" targetVCName:@"HSCITopicsVC"],nil];
    
    _tabVC = [[HSCITabVC alloc] init];
}

- (void) addSubviews {
    // buttons
    [self rangeButtons];
    
    // title
    UILabel *title = [[UILabel alloc] init];
    [self.view addSubview:title];
    title.text = @"COMPANY INTRODUCTION";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:30];
    title.textColor = [UIColor whiteColor];
    [title sizeToFit];
    [title makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(177);
        make.centerX.equalTo(self.view.centerX);
    }];
}

// Range buttons
- (void) rangeButtons {
    NSInteger count = [_btns count];
    CGFloat width = 240.0;
    CGFloat height = 126.0;
    CGFloat topOffsetOnFirst = 255.0;
    CGFloat topOffsetOnSecond = 425.0;
    CGFloat leftOffsetOnFirst = (AppWidth - (width+3) * 4) /2;
    CGFloat leftOffsetOnSecond = (AppWidth - (width+3) * 3) /2;
    CGFloat topOffset = topOffsetOnFirst;
    CGFloat leftOffset = leftOffsetOnFirst;
    for (int i = 0; i<count; i++) {
        if (i < 4) {
            topOffset = topOffsetOnFirst;
            leftOffset = leftOffsetOnFirst + (width + 5) * i;
        } else {
            topOffset = topOffsetOnSecond;
            leftOffset = leftOffsetOnSecond + (width + 5) * (i - 4);
        }
        
        HSImageButton *btn = [_btns objectAtIndex:i];
        [self.view addSubview:btn];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(width);
            make.height.equalTo(height);
            make.top.equalTo(self.view.top).offset(topOffset);
            make.left.equalTo(self.view.left).offset(leftOffset);
        }];
        btn.leftBtn.tag = i;
        [btn.leftBtn addTarget:self action:@selector(tab:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void) tab:(UIButton *) sender {
    _tabVC.selectedIndex = sender.tag;
    [self presentViewController:_tabVC animated:YES completion:nil];
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
