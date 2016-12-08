//
//  HSDBUtil.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSDBUtil.h"

@implementation HSDBUtil

static FMDatabaseQueue *_defaultDB;

+ (FMDatabaseQueue *)defaultDB {
    if (!_defaultDB) {
        NSString *dbFileName = @"data.db";
        
        if (![self dbExistForFileName:dbFileName]) {
            // copy the db file to the document directory
            [self copyDBForFileName:dbFileName];
        }
        
        _defaultDB = [self dbForFileName:dbFileName];
        
    }
    return _defaultDB;
}

+ (BOOL)dbExistForFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:dbPath];
}


+ (BOOL)copyDBForFileName:(NSString *)fileName {
    NSString *dbBundlePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
                                                             ofType:[fileName pathExtension]];
    if (!dbBundlePath) {
        [NSException raise:NSInvalidArgumentException format:@"The specified database file named as [%@] doesn't exist for the bundle path.", fileName];
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirDBPath = [[paths objectAtIndex:0]stringByAppendingPathComponent:fileName];
    
    // Copy to the documentDirectory
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    BOOL ifDone = [fileManager copyItemAtPath:dbBundlePath toPath:documentDirDBPath error:&error];
    
    return ifDone;
}


+ (FMDatabaseQueue *)dbForFileName:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *dbPath = [documentDirectory stringByAppendingPathComponent:fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:dbPath]) {
        [NSException raise:NSInvalidArgumentException format:@"The specified database file named as [%@] doesn't exist for the full path [%@].", fileName, dbPath];
    }
    
    FMDatabaseQueue *dbQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
    return dbQueue;
}


@end
