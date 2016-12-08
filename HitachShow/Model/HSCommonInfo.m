//
//  HSCommonInfo.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCommonInfo.h"

@implementation HSCommonInfo

static HSCommonInfo *_instance;

+ (HSCommonInfo *) shared {
    if (_instance == nil) {
        _instance = [[HSCommonInfo alloc] init];
    }
    return _instance;
}

- (NSArray *) findByCategory:(NSString *) category {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [self readDefaultDBWithTask:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:@"SELECT id,category,parent_id,name,title,picture,text1,text2,video,country,use,spec,distributor,complete_year,pdf,ppt FROM hs_common_info WHERE category = ? ",category];
        while ([resultSet next]) {
            HSCommonInfo *element = [self toObjectWithResult:resultSet];
            [array addObject:element];
        }
    }];
    
    return array;
}

- (HSCommonInfo *) findByID:(NSString *) ID {
    __block HSCommonInfo *commonInfo = nil;
    [self readDefaultDBWithTask:^(FMDatabase *db) {
        FMResultSet *resultSet = [db executeQuery:@"SELECT id,category,parent_id,name,title,picture,text1,text2,video,country,use,spec,distributor,complete_year,pdf,ppt FROM hs_common_info WHERE id = ? ",ID];
        while ([resultSet next]) {
            commonInfo = [self toObjectWithResult:resultSet];
        }
    }];
    
    return commonInfo;
}

- (HSCommonInfo *) toObjectWithResult:(FMResultSet *) resultSet {
    HSCommonInfo *commonInfo = [[HSCommonInfo alloc] init];
    commonInfo.ID = [resultSet stringForColumn:@"id"];
    commonInfo.category = [resultSet stringForColumn:@"category"];
    commonInfo.parentId = [resultSet stringForColumn:@"parent_id"];
    commonInfo.name = [resultSet stringForColumn:@"name"];
    commonInfo.title = [resultSet stringForColumn:@"title"];
    commonInfo.picture = [resultSet stringForColumn:@"picture"];
    commonInfo.text1 = [resultSet stringForColumn:@"text1"];
    commonInfo.text2 = [resultSet stringForColumn:@"text2"];
    commonInfo.video = [resultSet stringForColumn:@"video"];
    commonInfo.country = [resultSet stringForColumn:@"country"];
    commonInfo.use = [resultSet stringForColumn:@"use"];
    commonInfo.spec = [resultSet stringForColumn:@"spec"];
    commonInfo.distributor = [resultSet stringForColumn:@"distributor"];
    commonInfo.completeYear = [resultSet stringForColumn:@"complete_year"];
    commonInfo.pdf = [resultSet stringForColumn:@"pdf"];
    commonInfo.ppt = [resultSet stringForColumn:@"ppt"];
    
    return commonInfo;
}

@end
