//
//  HSCPTypeVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPTypeVC.h"
#import "HSImageButton.h"
#import "HSCPTypeTabVC.h"

@interface HSCPTypeVC ()

@end

@implementation HSCPTypeVC

- (void)viewDidLoad {
    self.mainTitle = @"Project Gallery";
    [super viewDidLoad];
    [self addSubviews];
}

-(void) addSubviews {
    NSArray *areas = [NSArray arrayWithObjects:@"Mix",@"Office",@"Residence",
                      @"Hotel",@"Shopping",@"Airport",@"Commercial",@"Others",@"", nil];
    NSInteger count = areas.count;
    
    CGFloat width = 240;
    CGFloat height = 120;
    for (int i=0; i<count;i++) {
        HSImageButton *btn = [[HSImageButton alloc] init];
        btn.leftTitle = [areas objectAtIndex:i];
        [self.view addSubview:btn];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(width);
            make.height.equalTo(height);
            make.top.equalTo(self.view.top).offset(255 + height * (i/3));
            make.left.equalTo(self.view.left).offset(100 + (i/3==1?width/2:0) + width * (i%3));
        }];
        btn.leftBtn.tag = i;
        [btn.leftBtn addTarget:self action:@selector(tab:) forControlEvents:UIControlEventTouchDown];
    }
}

-(void) tab:(UIButton *) sender {
    HSCPTypeTabVC *vc = [[HSCPTypeTabVC alloc] init];
    vc.selectedIndex = sender.tag;
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
