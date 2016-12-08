//
//  HSCIBaseVideoVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCIBaseVideoVC.h"
#import "HSVideoView.h"
#import "HSCommonInfo.h"

@interface HSCIBaseVideoVC ()

@end

@implementation HSCIBaseVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
}

- (void) addSubviews {
    // title
    UILabel *title = [[UILabel alloc] init];
    [self.view addSubview:title];
    title.text = _mainTitle;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:30 weight:0.5];
    title.textColor = [UIColor whiteColor];
    [title sizeToFit];
    [title makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(110);
        make.centerX.equalTo(self.view.centerX);
    }];
    
    // Video thumb
    CGFloat spacing = AppWidth - 280 * 2 - 145 * 2;
    NSInteger count = _videoList.count;
    count = count > 2 ? 2 : count;
    for (int i=0; i<count;i++) {
        HSCommonInfo *info = _videoList[i];
        HSVideoView *vv = [[HSVideoView alloc] init];
        [self.view addSubview:vv];
        NSArray *array = [info.video componentsSeparatedByString:@"."];
        vv.videoPath = [[NSBundle mainBundle] pathForResource:array[0] ofType:array[1]];
        vv.displayTitle = YES;
        [vv makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.view.centerY);
            make.size.equalTo(CGSizeMake(280, 230));
            make.left.equalTo(145 + (spacing + 280)*i);
        }];
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
