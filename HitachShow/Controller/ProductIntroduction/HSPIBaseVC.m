//
//  HSPIBaseVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSPIBaseVC.h"
#import "HSProductView.h"

@interface HSPIBaseVC ()

@end

@implementation HSPIBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubViews];
    self.view.layer.contents = (id) [UIImage imageNamed:@"pi_main_bg.jpg"].CGImage;
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
    
    // Main title
    UILabel *mainTitle = [[UILabel alloc] init];
    [self.view addSubview:mainTitle];
    mainTitle.text = _topTitle;
    mainTitle.textColor = [UIColor whiteColor];
    mainTitle.backgroundColor = [UIColor clearColor];
    mainTitle.textAlignment = NSTextAlignmentCenter;
    mainTitle.font = [UIFont systemFontOfSize:30 weight:0.5];
    [mainTitle makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX);
        make.top.equalTo(self.view.top).offset(50);
        make.size.equalTo(CGSizeMake(568, 44));
    }];
    
    // Product scroll panel
    UIScrollView *productPanel = [[UIScrollView alloc] init];
    [self.view addSubview:productPanel];
    [productPanel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainTitle.bottom).offset(35);
        make.left.equalTo(self.view.left).offset(65);
        make.right.equalTo(self.view.right).offset(-65);
        make.height.equalTo(550);
    }];
    
    // Product list
    NSInteger count = _products.count;
    CGFloat spacing = (AppWidth - 130 - 235 * 3)/2+235;
    for (int i=0; i<count; i++) {
        HSDisplayInfo *product = _products[i];
        HSProductView *pw = [[HSProductView alloc] init];
        [productPanel addSubview:pw];
        
        pw.image = [UIImage imageNamed:product.image];
        pw.pdfPath = product.pdfPath;
        pw.pptPath = product.pptPath;
        pw.videoPath = product.videoPath;
        pw.productName = product.productName;
        pw.detail = product.detail;
        pw.remark = product.remark;
        
        [pw makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(productPanel.left).offset(spacing*i);
            make.top.equalTo(productPanel.top);
            make.size.equalTo(CGSizeMake(235, 450));
        }];
    }
    
    if (count > 3) {
        productPanel.contentSize = CGSizeMake(AppWidth - 130 + spacing * (count-3),550);
        productPanel.scrollEnabled = YES;
        productPanel.showsHorizontalScrollIndicator = YES;
        productPanel.userInteractionEnabled = YES;
        [productPanel flashScrollIndicators];
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
