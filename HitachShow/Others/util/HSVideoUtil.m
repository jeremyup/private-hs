//
//  HSVideoUtil.m
//  HitachShow
//
//  Created by Jeremy on 2017/2/13.
//  Copyright © 2017年 hitach. All rights reserved.
//

#import "HSVideoUtil.h"
#import "MRVLCPlayer.h"

@implementation HSVideoUtil

+ (void) showVideo:(UIView *) view videoPath:(NSString *) videoPath {
    MRVLCPlayer *player = [[MRVLCPlayer alloc] init];
    player.bounds = CGRectMake(0, 0, AppWidth, AppHeight);
    player.center = view.center;
    
    player.mediaURL = [NSURL fileURLWithPath:videoPath];
    
    [player showInView:view.window];
}

@end
