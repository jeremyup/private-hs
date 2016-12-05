//
//  HSOSMainViewController.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSMaintenanceVC.h"
#import "HSDisplayInfo.h"
#import "HSVideoView.h"

@interface HSMaintenanceVC ()

@property(nonatomic,strong) NSMutableArray *videoList;

@end

@implementation HSMaintenanceVC

- (void)viewDidLoad {
    _videoList = [NSMutableArray arrayWithCapacity:25];
    for (int i=0; i<30; i++) {
        HSDisplayInfo *info = [[HSDisplayInfo alloc] init];
        info.videoPath = [[NSBundle mainBundle] pathForResource:@"duihua" ofType:@"mp4"];
        [_videoList addObject:info];
    }
    
    [super viewDidLoad];
    self.view.layer.contents = (id) [UIImage imageNamed:@"maintenance_bg.jpg"].CGImage;
    
    [self addSubviews];
}

- (void) addSubviews {
    // Main title
    UILabel *mainTitle = [[UILabel alloc] init];
    [self.view addSubview:mainTitle];
    mainTitle.text = @"Maintenance";
    mainTitle.textColor = [UIColor blackColor];
    mainTitle.font = [UIFont systemFontOfSize:30];
    [mainTitle makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(54);
        make.left.equalTo(self.view.left).offset(180);
        make.size.equalTo(CGSizeMake(220, 37));
    }];
    
    
    // Video list arrange
    CGFloat spacing = (AppWidth - 10*4 - 180*5)/2;
    NSInteger count = _videoList.count;
    
    UIScrollView *videoPanel = [[UIScrollView alloc] init];
    [self.view addSubview:videoPanel];
    [videoPanel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mainTitle.bottom).offset(15);
        make.left.equalTo(self.view.left).offset(spacing);
        make.right.equalTo(self.view.right).offset(-spacing + 10);
        make.height.equalTo(580);
    }];
    if (count > 20) {
        long n = count / 5;
        if (count % 5 >0) {
            n += 1;
        }
    
        videoPanel.contentSize = CGSizeMake(AppWidth - spacing*2,145 * n);
        videoPanel.scrollEnabled = YES;
        videoPanel.showsVerticalScrollIndicator = YES;
        videoPanel.userInteractionEnabled = YES;
        [videoPanel flashScrollIndicators];
    }
    
    // If the number of video becomes large,the stack maybe over flow!
    for (int i=0; i<count; i++) {
        HSDisplayInfo *info = _videoList[i];
        HSVideoView *vv = [[HSVideoView alloc] init];
        [videoPanel addSubview:vv];
        vv.videoPath = info.videoPath;
        vv.displayTitle = NO;
        
        [vv makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(180, 137));
            make.top.equalTo(videoPanel.top).offset(145 * (i/5));
            make.left.equalTo(videoPanel.left).offset(190*(i%5));
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
