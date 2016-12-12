//
//  HSAlertView.m
//  HitachShow
//
//  Created by Jeremy on 16/12/12.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSAlertView.h"

@implementation HSAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString*)otherButtonTitles block:(TouchBlock)block{
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self) {
        self.block = block;
    }
    return self;
}

//#pragma mark -AlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    _block(buttonIndex);
}
@end
