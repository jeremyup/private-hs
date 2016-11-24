//
//  HSCompanyInfo.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSDisplayInfo : NSObject

@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *introduction;
@property(nonatomic,strong) NSString *info;
@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) NSString *btnText;
@property(nonatomic,strong) NSString *videoPath;
@property(nonatomic,strong) NSArray *subInfos;

#pragma for product show
@property(nonatomic,strong) NSString *detail;
@property(nonatomic,strong) NSString *remark;
@property(nonatomic,strong) NSString *productName;
@property(nonatomic,strong) NSString *pdfPath;
@property(nonatomic,strong) NSString *pptPath;

@end
