//
//  HSInitUtil.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSAppUtil.h"
#import "HSDBUtil.h"
#import "HSResUtil.h"
#import "AFNetworking.h"
#import "HSAlertView.h"

NSString * const INIT_FLAG = @"INIT_FLAG";
NSString * const DEFAULT_VERSION = @"V1.0";
NSString * const RESOURCE_VERSION = @"RESOURCE_VERSION";
NSString * const SERVER_URL = @"SERVER_URL";

@interface HSAppUtil()

@property(nonatomic,strong) NSMutableArray *zipPaths;
@property(nonatomic) NSInteger versionCount;

@end

@implementation HSAppUtil

+ (void) appInit {
    NSString *init = [[NSUserDefaults standardUserDefaults] objectForKey:INIT_FLAG];
    if (!init) {
        // Database init
        [HSDBUtil defaultDB];
        // Resource init
        [HSResUtil initResource];
        
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:INIT_FLAG];
    }
}

- (void) checkResourceVersion {
    NSString *serverURL = [HSAppUtil serverURL];
    if (!serverURL) {
        NSLog(@"Server url does not config!");
        return;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *url = [serverURL stringByAppendingFormat:@"/api/version?v=%@",[HSAppUtil currentVersion]];
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (!error) {
            NSArray *array = responseObject;
            if (array.count > 0) {
                HSAlertView *alert = [[HSAlertView alloc] initWithTitle:nil message:@"There is a new version,whether to update?" cancelButtonTitle:@"Cancel" otherButtonTitles:@"Sure" block:^(NSInteger buttonIndex,UIAlertView *alertView) {
                    if (buttonIndex == 1) {
                        _zipPaths = [[NSMutableArray alloc] init];
                        _versionCount = array.count;
                        for (NSDictionary *dic in array) {
                            [self downloadAndUpdate:dic[@"url"]];
                        }
                    }
                }];
                [alert show];
            }
        } else {
            NSLog(@"Resource data can't be updated cause network error!");
            //            NSLog(@"Error: %@", error)
        }
    }];
    [dataTask resume];
}

// Download resource,unzip and update database
- (void) downloadAndUpdate:(NSString *) url {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSString *pathStr = [filePath path];
        [_zipPaths addObject:pathStr];
        // Update after download all zip
        if (_zipPaths.count == _versionCount) {
            [self batchUpdateWithPaths:_zipPaths];
        }
    }];
    [downloadTask resume];
}

// Batch update version resource
- (void) batchUpdateWithPaths:(NSMutableArray *) zipPaths {
    NSArray *sortedArray = [zipPaths sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *str1=(NSString *)obj1;
        NSString *str2=(NSString *)obj2;
        str1 = [[[str1 lastPathComponent] stringByDeletingPathExtension] substringFromIndex:1];
        str2 = [[[str2 lastPathComponent] stringByDeletingPathExtension] substringFromIndex:1];
        return [str1 doubleValue] > [str2 doubleValue];
    }];
    for (NSString *pathStr in sortedArray) {
        if (pathStr) {
            [HSResUtil updateResourceWithPath:pathStr];
            NSString *version = [pathStr.lastPathComponent stringByDeletingPathExtension];
            [[NSUserDefaults standardUserDefaults] setObject:version forKey:RESOURCE_VERSION];
            NSLog(@"Resource version has updated to %@ " ,version);
        }
    }
}

+ (NSString *) currentVersion {
    NSString *currentVersion = [[NSUserDefaults standardUserDefaults] objectForKey:RESOURCE_VERSION];
    if (!currentVersion) {
        currentVersion = DEFAULT_VERSION;
    }
    return currentVersion;
}

+ (NSString *) serverURL {
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:SERVER_URL];
    if (!url) {
        url = @"";
    }
    return url;
}

+ (void) setServerURL:(NSString *) url {
    [[NSUserDefaults standardUserDefaults] setObject:url forKey:SERVER_URL];
}

@end
