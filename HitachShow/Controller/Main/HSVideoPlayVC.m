//
//  HSVideoPlayVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSVideoPlayVC.h"
#import "MobileVLCKit/MobileVLCKit.h"


@interface HSVideoPlayVC ()

@property(nonatomic,strong) VLCMediaPlayer *player;

@end

@implementation HSVideoPlayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppWidth, AppHeight)];
    [self.view addSubview:videoView];
    _player = [[VLCMediaPlayer alloc] initWithOptions:nil];
    _player.drawable = videoView;
    _player.media = [VLCMedia mediaWithPath:_videoPath];
    
    // Click event
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [videoView addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated {
    [_player play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_player stop];
}

- (void)click {
    [self dismissViewControllerAnimated:YES completion:nil];
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
