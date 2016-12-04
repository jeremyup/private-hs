//
//  HSProject.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSProject.h"

@implementation HSProject

+ (NSArray *) listByArea:(NSString *)area {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:3];
    for (int i=0;i<14;i++) {
        HSProject *p = [[HSProject alloc] init];
        p.name = @"CITIC Plaza,Guangzhou";
        p.country = @"China";
        p.use = @"Airport";
        p.image = @"";
        p.spec = @"ELx33";
        p.distributor = @"Hitachi Elevator Asia Pte Ltd";
        p.yearOfCompletion = @"2008";
        [array addObject:p];
    }
    
    return array;
}

@end
