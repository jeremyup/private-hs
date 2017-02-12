//
//  HSImageButton.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSBaseVC.h"

@interface HSImageButton : UIView

@property(strong,nonatomic) NSString *leftTitle;
@property(strong,nonatomic) NSString *rightImage;
@property(strong,nonatomic) NSString *targetVCName;
@property(strong,nonatomic) UIButton *leftBtn;
@property(strong,nonatomic) UIButton *rightImgV;


+(HSImageButton *) initWithTitle:(NSString *) leftTitle rightImage:(NSString *) rightImage targetVCName:(NSString *) name;

@end
