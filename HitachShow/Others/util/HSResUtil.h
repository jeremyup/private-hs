//
//  HSResUtil.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSResUtil : NSObject

+ (NSString *) pathWithFileName:(NSString *) fileName;

+ (void) initResource;

+ (UIImage *) imageNamed:(NSString *) name;

// path is zip's full path
+ (void) updateResourceWithPath:(NSString *) path;

@end