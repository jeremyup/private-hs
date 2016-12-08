//
//  HSResUtil.m
//  HitachShow
//
//  Created by Jeremy .
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSResUtil.h"

@implementation HSResUtil

+ (NSString *) pathWithFileName:(NSString *) fileName {
    NSString *path = nil;
    if (fileName != nil) {
        NSArray *parts = [fileName componentsSeparatedByString:@"."];
        path = [[NSBundle mainBundle] pathForResource:parts[0] ofType:parts[1]];
    }
    return path;
}

@end
