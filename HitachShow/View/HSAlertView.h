//
//  HSAlertView.h
//  HitachShow
//
//  Created by Jeremy on 16/12/12.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSAlertView;
typedef void (^TouchBlock)(NSInteger,UIAlertView*);
@interface HSAlertView : UIAlertView

@property(nonatomic,copy)TouchBlock block;

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString*)otherButtonTitles
              block:(TouchBlock)block;
@end
