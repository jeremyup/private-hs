//
//  HSCPMainViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPMainVC.h"
#import "HSImageButton.h"
#import "HSCPTabVC.h"

@interface HSCPMainVC ()

@property(nonatomic,strong) NSArray *keys;
@property(nonatomic,strong) NSDictionary *kv;

@end

@implementation HSCPMainVC

- (void)viewDidLoad {
    self.mainTitle = @"Project Gallery";
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self addSubviews];
}

- (void) addSubviews {
    _kv = @{@"Area":@"HSCPAreaVC",@"Building Type":@"HSCPTypeVC"};
    _keys = _kv.allKeys;
    CGFloat width = 240.0;
    CGFloat height = 126.0;
    for (int i=0;i<_keys.count;i++) {
        NSString *key = _keys[i];
        HSImageButton *imageBtn = [[HSImageButton alloc] init];
        [self.view addSubview:imageBtn];
        imageBtn.leftTitle = key;
        imageBtn.targetVCName = _kv[key];
        [imageBtn.leftBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        imageBtn.leftBtn.tag = i;
        
        [imageBtn makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(width, height));
            make.centerY.equalTo(self.view.centerY);
            make.centerX.equalTo(self.view.centerX).offset((width + 14) * (i - 0.5));
        }];
        
    }
}

- (void)click:(UIButton *) sender {
    HSCPTabVC *tabVC = [[HSCPTabVC alloc] init];
    tabVC.selectedIndex = sender.tag;
    [self presentViewController:tabVC animated:YES completion:nil];
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
