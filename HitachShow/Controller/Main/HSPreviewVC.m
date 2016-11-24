//
//  HSPreviewVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSPreviewVC.h"
#import <QuickLook/QuickLook.h>

@interface HSPreviewVC ()<QLPreviewControllerDataSource>

@end

@implementation HSPreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = self;
}

#pragma mark - previewControllerDataSource
-(NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController*)controller
{
    return 1;
}

-(id<QLPreviewItem>)previewController:(QLPreviewController*)controller previewItemAtIndex:(NSInteger)index {
    NSURL * url =[NSURL fileURLWithPath: _filePath];
    return url;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
