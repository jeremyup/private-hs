//
//  HSFileUtil.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSFileUtil.h"

@implementation HSFileUtil

+ (BOOL) fileExistInDocWithName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:dbPath];
}


+ (BOOL) copyFromBundleToDocDirWithName:(NSString *)fileName {
    NSString *dbBundlePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
                                                             ofType:[fileName pathExtension]];
    if (!dbBundlePath) {
        [NSException raise:NSInvalidArgumentException format:@"The specified file named as [%@] doesn't exist for the bundle path.", fileName];
    }

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:fileName];
    // Copy to the documentDirectory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL ifDone = [fileManager copyItemAtPath:dbBundlePath toPath:filePath error:&error];
    
    return ifDone;
}

+ (BOOL) removeWithPath:(NSString *) filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *err;
    BOOL ifDone = [fileManager removeItemAtPath:filePath error:&err];
    return  ifDone;
}

+ (NSString *) documentPathWithName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:fileName];
}

+ (void) moveItemsToDocWithPath:(NSString *) folderPath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:folderPath error:&error];
    if (!error) {
        for (NSString *sourceFileName in contents) {
            NSString *sourcePath = [folderPath stringByAppendingPathComponent:sourceFileName];
            NSString *targetPath = [HSFileUtil documentPathWithName:sourceFileName];
            [fileManager moveItemAtPath:sourcePath toPath:targetPath error:&error];
        }
    }
}

@end
