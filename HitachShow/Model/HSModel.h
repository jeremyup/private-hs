//
//  HSEntity.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface HSModel : NSObject

- (void)readDefaultDBWithTask:(void (^)(FMDatabase *db))task;

- (void)writeDefaultDBWithTask:(void (^)(FMDatabase *db, BOOL *rollback))task;

@end
