//
//  HSCPAreaVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPAreaVC.h"
#import "HSImageButton.h"
#import "HSCPAreaPartVC.h"
#import "HSProject.h"

@interface HSCPAreaVC ()

@end

@implementation HSCPAreaVC

- (void)viewDidLoad {
    self.mainTitle = @"Project Gallery";
    [super viewDidLoad];
    [self addSubviews];
}

-(void) addSubviews {
    NSArray *areas = [NSArray arrayWithObjects:@"East Asia",@"Southeast Asia",@"Southern Asia",@"West Asia\nMiddle Asia", nil];
    NSInteger count = areas.count;
    
    CGFloat width = 321;
    CGFloat height = 165;
    for (int i=0; i<count;i++) {
        HSImageButton *btn = [[HSImageButton alloc] init];
        btn.leftTitle = [areas objectAtIndex:i];
        [self.view addSubview:btn];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(width);
            make.height.equalTo(height);
            make.top.equalTo(self.view.top).offset(255 + height * (i/2));
            make.left.equalTo(self.view.left).offset(100 + width/2 * (i/2) + width * (i%2));
        }];
        btn.leftBtn.tag = i;
        [btn.leftBtn addTarget:self action:@selector(tab:) forControlEvents:UIControlEventTouchDown];
    }
}

-(void) tab:(UIButton *) sender {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:3];
    for (int i=0;i<14;i++) {
        HSProject *p = [[HSProject alloc] init];
        p.name = @"CITIC Plaza,Guangzhou";
        p.country = @"China";
        p.image = @"";
        [array addObject:p];
    }
    // TODO
    HSCPAreaPartVC *vc = [[HSCPAreaPartVC alloc] init];
    vc.projects = array;
    vc.areaName = @"The southeast Asia";
    [self presentViewController:vc animated:YES completion:nil];
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
