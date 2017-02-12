//
//  HSMainViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSMainVC.h"
#import "HSMainTabController.h"
#import "HSPITabVC.h"
#import "HSAppUtil.h"
#import "HSAlertView.h"


@interface HSMainVC ()

@end

@implementation HSMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.contents = (id)[UIImage imageNamed:@"main_bg.jpg"].CGImage;
    
    [self addSubViews];
}

- (void) addSubViews {
    // LOGO
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png" ]];
    [self.view addSubview:logoView];
    [logoView makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(123.5);
        make.height.equalTo(35.5);
        make.left.equalTo(self.view.left).offset(17);
        make.top.equalTo(self.view.top).offset(30);
    }];
    
    // Resource version info
    UILabel *versionLabel = [[UILabel alloc] init];
    [self.view addSubview:versionLabel];
    versionLabel.backgroundColor = [UIColor clearColor];
    versionLabel.text = [@"Res:" stringByAppendingString:[HSAppUtil currentVersion]];
    versionLabel.font = [UIFont systemFontOfSize:10];
    versionLabel.textAlignment = NSTextAlignmentRight;
    [versionLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.right).offset(-10);
        make.top.equalTo(self.view.top).offset(10);
        make.size.equalTo(CGSizeMake(60, 15));
    }];
    
    UIButton *setBtn = [[UIButton alloc] init];
    [self.view addSubview:setBtn];
    [setBtn setTitle:@"Setting" forState:UIControlStateNormal];
    setBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    setBtn.titleLabel.textColor = [UIColor whiteColor];
    [setBtn makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(60, 20));
        make.centerY.equalTo(versionLabel.centerY);
        make.right.equalTo(versionLabel.left).offset(10);
    }];
    setBtn.backgroundColor = [UIColor grayColor];
    [setBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
    
    
    // Four module
    NSArray *btnImages = [NSArray arrayWithObjects:@"main_btn_company_introduction.png",
                          @"main_btn_classic_project.png",
                          @"main_btn_product_introduction.png",
                          @"main_btn_maintenance.png" ,nil];
    CGFloat btnWidth = 180.5;
    CGFloat btnHeight = 338.0;
    CGFloat btnOffset = 100.0;
    CGFloat spacing = (AppWidth - btnOffset * 2) / 4;
    for (int i = 0;i < 4;i++) {
        UIButton *btn = [[UIButton alloc] init];
        [self.view addSubview:btn];
        btn.layer.borderWidth = 1;
        [btn setImage:[UIImage imageNamed:btnImages[i]] forState:UIControlStateNormal];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(btnWidth);
            make.height.equalTo(btnHeight);
            make.centerY.equalTo(self.view.centerY);
            make.left.equalTo(self.view.left).offset(btnOffset + spacing * i);
        }];
        [btn addTarget:self action:@selector(presentVC:) forControlEvents:UIControlEventTouchDown];
        btn.tag = i;
    }
}

- (void) presentVC:(UIButton *) sender {
    NSInteger index = [sender tag];
    HSMainTabController *mainTabVC = [[HSMainTabController alloc] init];
    if (index !=2) {
        mainTabVC.selectedIndex = index;
        [self presentViewController:mainTabVC animated:YES completion:nil];
    } else {
        // Production introduction do not like other tab page,need create new view
        HSPITabVC *piTab = [[HSPITabVC alloc] init];
        [piTab setSelectedIndex:0];
        [self presentViewController:piTab animated:YES completion:nil];
    }
}

-(void) click {
    NSString *msg = [@"Current server url is " stringByAppendingString:[HSAppUtil serverURL]];
    
    HSAlertView *alert = [[HSAlertView alloc] initWithTitle:@"Resource server url config" message:msg cancelButtonTitle:@"Cancel" otherButtonTitles:@"Done" block:^(NSInteger buttonIndex,UIAlertView *alertView) {
        if (buttonIndex == 1) {
            UITextField *textField = [alertView textFieldAtIndex:0];
            NSString *text = textField.text;
            if (text) {
                [HSAppUtil setServerURL:text];
            }
        }
    }];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
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
