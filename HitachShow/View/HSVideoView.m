//
//  HSVideoView.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSVideoView.h"
#import "HSViewUtil.h"
#import "HSVideoUtil.h"

@interface HSVideoView ()

@property(nonatomic,strong) UIImageView *thumb;
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UIImageView *playBtn;

@end

@implementation HSVideoView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _thumb = [[UIImageView alloc] init];
        [self addSubview:_thumb];
        _title = [[UILabel alloc] init];
        [self addSubview:_title];
        _playBtn = [[UIImageView alloc] init];
        [self addSubview:_playBtn];
        
    }
    return self;
}

-(void) layoutSubviews {
    self.backgroundColor = [UIColor blackColor];
    [_thumb makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.top.equalTo(self.top).offset(5);
        make.bottom.equalTo(self.bottom).offset(5);
    }];
    
    NSString *thumbPath = [_videoPath stringByReplacingOccurrencesOfString:[@"." stringByAppendingString: [_videoPath pathExtension]]   withString:@"thumb.jpg"];
    [_thumb setImage:[UIImage imageWithContentsOfFile:thumbPath]];
    // Click event
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tapGesture];
    
    [_playBtn setImage:[UIImage imageNamed:@"btn_video_play.png"]];
    [_playBtn makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_thumb.center);
    }];
    
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

- (void) click {
    if (!_videoPath || [_videoPath isEqualToString:@""]) {return;}
    UIViewController *vc = [HSViewUtil findViewController:self];
    
    [HSVideoUtil showVideo:vc.view videoPath:_videoPath];
}

@end
