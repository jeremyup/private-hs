//
//  HSFileUtil.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSFileUtil : NSObject

+ (BOOL) fileExistInDocWithName:(NSString *)fileName;

+ (BOOL) copyFromBundleToDocDirWithName:(NSString *)fileName;

+ (BOOL) removeWithPath:(NSString *) filePath;

+ (NSString *) documentPathWithName:(NSString *)fileName;

@end
