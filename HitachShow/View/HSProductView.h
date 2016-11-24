//
//  HSProductView.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSProductView : UIView

@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) NSString *pptPath;
@property(nonatomic,strong) NSString *pdfPath;
@property(nonatomic,strong) NSString *videoPath;
@property(nonatomic,strong) NSString *productName;
@property(nonatomic,strong) NSString *detail;
@property(nonatomic,strong) NSString *remark;

@end
