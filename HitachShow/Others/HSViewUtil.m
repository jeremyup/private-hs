//
//  HSViewUtil.m
//  HitachShow
//
//  Created by Jeremy .
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSViewUtil.h"

@implementation HSViewUtil

+ (UIViewController *)findViewController:(UIView *)sourceView
{
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    return target;
}

@end
