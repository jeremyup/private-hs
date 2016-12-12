//
//  FMDatabase+HSPersistence.h
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface FMDatabase (HSPersistence)

- (BOOL)executeUpdate:(NSString *)sql withParameterObject:(id)arguments;

@end
