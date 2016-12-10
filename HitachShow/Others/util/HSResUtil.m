//
//  HSResUtil.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSResUtil.h"
#import "HSFileUtil.h"
#import "ZipArchive.h"

@implementation HSResUtil

+ (NSString *) pathWithFileName:(NSString *) fileName {
    NSString *path = nil;
    if (fileName != nil) {
        path = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension] ofType:[fileName pathExtension]];
    }
    return path;
}

+ (void) initResource {
    NSString *fileName = @"default-imgs.zip";
    BOOL done = [HSFileUtil copyFromBundleToDocDirWithName:fileName];
    // unzip default resource
    ZipArchive *zipArchive = [[ZipArchive alloc] init];
    BOOL open = [zipArchive UnzipOpenFile:[HSFileUtil documentPathWithName:fileName]];
    if (open) {
        [zipArchive UnzipFileTo:[HSFileUtil documentPathWithName:@""] overWrite:YES];
        [zipArchive UnzipCloseFile];
    }
    
    // delete from bundle
    BOOL exist = [HSFileUtil fileExistInDocWithName:fileName];
    if (done && exist) {
        NSString *filePath = [HSResUtil pathWithFileName:fileName];
        [HSFileUtil removeWithPath:filePath];
    }
    
}

+ (UIImage *) imageNamed:(NSString *) name {
    NSString *path = [HSFileUtil documentPathWithName:name];
    return [UIImage imageWithContentsOfFile:path];
}

@end
