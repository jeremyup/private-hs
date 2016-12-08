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
@property(nonatomic,strong) NSString *parentId;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *picture;
@property(nonatomic,strong) NSString *text1;
@property(nonatomic,strong) NSString *text2;
@property(nonatomic,strong) NSString *video;
@property(nonatomic,strong) NSString *country;
@property(nonatomic,strong) NSString *use;
@property(nonatomic,strong) NSString *spec;
@property(nonatomic,strong) NSString *distributor;
@property(nonatomic,strong) NSString *completeYear;
@property(nonatomic,strong) NSString *pdf;
@property(nonatomic,strong) NSString *ppt;

+ (HSCommonInfo *) shared;

- (NSArray *) findByCategory:(NSString *) category;

- (HSCommonInfo *) findByID:(NSString *) ID;

@end
