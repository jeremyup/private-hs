//
//  HSInitUtil.m
//  HitachShow
//
//  Created by Jeremy .
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSInitUtil.h"
#import "HSDBUtil.h"
#import "HSResUtil.h"

NSString * const INIT_FLAG = @"INIT_FLAG";

@implementation HSInitUtil

+ (void) appInit {
    NSString *init = [[NSUserDefaults standardUserDefaults] objectForKey:INIT_FLAG];
    if (!init) {
        // Database init
        [HSDBUtil defaultDB];
        [HSResUtil initResource];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:INIT_FLAG];
    }
}

@end
