//
//  HSDBUtil.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSDBUtil.h"
#import "HSFileUtil.h"

@implementation HSDBUtil

static FMDatabaseQueue *_defaultDB;

+ (FMDatabaseQueue *)defaultDB {
    if (!_defaultDB) {
        NSString *dbFileName = @"data.db";
        
        if (![HSFileUtil fileExistInDocWithName:dbFileName]) {
            // copy the db file to the document directory
            [HSFileUtil copyFromBundleToDocDirWithName:dbFileName];
        }
        
        _defaultDB = [self dbForFileName:dbFileName];
        
    }
    return _defaultDB;
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
