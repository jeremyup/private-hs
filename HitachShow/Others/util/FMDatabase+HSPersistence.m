//
//  FMDatabase+HSPersistence.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "FMDatabase+HSPersistence.h"

@implementation FMDatabase(HSPersistence)

- (BOOL)executeUpdate:(NSString *)sql withParameterObject:(id)arguments{
    NSMutableDictionary *argDict = [self createParameterDictionaryWithObject:arguments ForSql:sql];
    return [self executeUpdate:sql withParameterDictionary:argDict];
}

- (NSMutableDictionary *)createParameterDictionaryWithObject:(id)arguments ForSql:(NSString *)sql {
    NSMutableDictionary *argDict = [NSMutableDictionary dictionary];
    
    BOOL inQuotes = NO;
    BOOL inEscapeQuotes = NO;
    BOOL inArg = NO;
    
    NSString *argName = nil;
    id argValue = nil;
    
    NSMutableCharacterSet *argCharSet = [NSMutableCharacterSet alphanumericCharacterSet];
    [argCharSet addCharactersInString:@"_"];
    
    NSUInteger l = sql.length;
    unichar c = 0;
    NSRange r = NSMakeRange(0, 0);
    
    for (NSUInteger i = 0; i < l; ++i) {
        c = [sql characterAtIndex:i];
        
        if (inEscapeQuotes) {
            inEscapeQuotes = NO;
        } else if (inQuotes) {
            if (c == '\'') {
                if ((i < l - 1) && [sql characterAtIndex:i + 1] == '\'') {
                    inEscapeQuotes = YES;
                } else {
                    inQuotes = NO;
                }
            } // else NOP
        } else if (inArg) {
            if (![argCharSet characterIsMember:c]) {
                inArg = NO;
                r.length = i - r.location;
                
                argName = [sql substringWithRange:r];
                argValue = [arguments valueForKey:argName];
                argDict[argName] = [self dbValueForObject:argValue];
                
                --i;
            } // else NOP
        } else {
            if (c == '\'') {
                if ((i < l - 1) && [sql characterAtIndex:i + 1] == '\'') {
                    inEscapeQuotes = YES;
                } else {
                    inQuotes = YES;
                }
            } else if (c == ':') {
                inArg = YES;
                r.location = i + 1;
            } // else NOP
        }
    }
    
    if (inArg) {
        r.length = l - r.location;
        
        argName = [sql substringWithRange:r];
        argValue = [arguments valueForKey:argName];
        argDict[argName] = [self dbValueForObject:argValue];
    } // else NOP
    
    return argDict;
}

- (id)dbValueForObject:(id)object {
    id dbValue = nil;
    
    if (!object) {
        dbValue = [NSNull null];
    } else if ([object isKindOfClass:NSArray.class]
               || [object isKindOfClass:NSDictionary.class]){
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        dbValue =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    } else {
        dbValue = object;
    }
    
    return dbValue;
}

@end
