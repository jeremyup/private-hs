//
//  HSVideoPlayVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSVideoPlayVC.h"
//#import "MobileVLCKit/MobileVLCKit.h"
#import "MRVLCPlayer.h"


@interface HSVideoPlayVC ()

@property(nonatomic,strong) VLCMediaPlayer *player;

@end

@implementation HSVideoPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MRVLCPlayer *player = [[MRVLCPlayer alloc] init];
    player.bounds = CGRectMake(0, 0, AppWidth, AppHeight);
    player.center = self.view.center;
    
    player.mediaURL = [NSURL fileURLWithPath:_videoPath];
    
    [player showInView:self.view];
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
