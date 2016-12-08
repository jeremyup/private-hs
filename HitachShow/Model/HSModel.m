//
//  HSEntity.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSModel.h"
#import "HSDBUtil.h"

@implementation HSModel

- (void)readDefaultDBWithTask:(void (^)(FMDatabase *db))task {
    [[HSDBUtil defaultDB] inDatabase:task];
}

- (void)writeDefaultDBWithTask:(void (^)(FMDatabase *db, BOOL *rollback))task {
    [[HSDBUtil defaultDB] inTransaction:task];
}

@end
