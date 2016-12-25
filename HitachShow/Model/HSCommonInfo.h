//
//  HSCommonInfo.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HSModel.h"

@interface HSCommonInfo : HSModel


@property(nonatomic,strong) NSString *ID;//custom id
@property(nonatomic,strong) NSString *category;// custom
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *picture;
@property(nonatomic,strong) NSString *text1;
@property(nonatomic,strong) NSString *text2;
@property(nonatomic,strong) NSString *video;
@property(nonatomic,strong) NSString *pdf;
@property(nonatomic,strong) NSString *ppt;
@property(nonatomic,strong) NSString *country;
@property(nonatomic,strong) NSString *spec;
@property(nonatomic,strong) NSString *distributor;
@property(nonatomic,strong) NSString *completeYear;
@property(nonatomic,strong) NSString *area;
@property(nonatomic,strong) NSString *type;
@property(nonatomic) int enabled;


@property(nonatomic,strong) NSArray *subInfos;

+ (HSCommonInfo *) shared;

- (HSCommonInfo *) initWithDictionary:(NSDictionary *) dictionary;

- (NSArray *) findByCategory:(NSString *) category;

// For classic project module
- (NSArray *) findByArea:(NSString *) area;
- (NSArray *) findByType:(NSString *) type;

- (HSCommonInfo *) findByID:(NSString *) ID;
- (void) saveOrUpdate;

@end
