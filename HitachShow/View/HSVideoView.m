//
//  HSVideoView.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSVideoView.h"
#import "MobileVLCKit/MobileVLCKit.h"
#import "HSViewUtil.h"
#import "HSVideoPlayVC.h"

@interface HSVideoView () <VLCMediaThumbnailerDelegate>

@property(nonatomic,strong) UIImageView *thumb;
@property(nonatomic,strong) UILabel *title;

@end

@implementation HSVideoView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _thumb = [[UIImageView alloc] init];
        [self addSubview:_thumb];
        _title = [[UILabel alloc] init];
        [self addSubview:_title];
    }
    return self;
}

-(void) layoutSubviews {
    self.backgroundColor = [UIColor blackColor];
    // Video thumb
    [self updateThumb];
    [_thumb makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.top.equalTo(self.top).offset(5);
        make.bottom.equalTo(self.bottom).offset(5);
    }];
    // Click event
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tapGesture];
    
    // titile
    _title.text = @"Movie";
    _title.textColor = [UIColor whiteColor];
    _title.font = [UIFont systemFontOfSize:14 weight:1];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.backgroundColor = [UIColor blackColor];
    [_title makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottom).offset(10);
        make.centerX.equalTo(self.centerX);
        make.size.equalTo(CGSizeMake(55, 15));
    }];
    if (!_displayTitle) {
        _title.hidden = YES;
    }
}

// Auto update thumbnail
- (void)setVideoPath:(NSString *)videoPath {
    _videoPath = videoPath;
    if (_videoPath && ![_videoPath isEqualToString:@""]) {
        [self updateThumb];
    }
}

-(void) updateThumb {
    if (!_videoPath || [_videoPath isEqualToString:@""]) {return;}
    VLCMediaThumbnailer *thumbnailer = [VLCMediaThumbnailer thumbnailerWithMedia:[VLCMedia mediaWithPath:_videoPath] andDelegate:self];
    [thumbnailer fetchThumbnail];
}

- (void) click {
    if (!_videoPath || [_videoPath isEqualToString:@""]) {return;}
    UIViewController *vc = [HSViewUtil findViewController:self];
    // Play video
    HSVideoPlayVC *videoVC = [[HSVideoPlayVC alloc] init];
    videoVC.videoPath = _videoPath;
    [vc presentViewController:videoVC animated:YES completion:nil];
}

#pragma VLCThumbnailer delegate implement
- (void)mediaThumbnailerDidTimeOut:(VLCMediaThumbnailer *)mediaThumbnailer {
    // TODO 
}
- (void)mediaThumbnailer:(VLCMediaThumbnailer *)mediaThumbnailer didFinishThumbnail:(CGImageRef)thumbnail {
    UIImage *image = [UIImage imageWithCGImage:thumbnail];
    [_thumb setImage:image];
}

@end
