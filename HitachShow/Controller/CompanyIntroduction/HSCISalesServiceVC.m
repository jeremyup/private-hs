//
//  HSCISalesServiceVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCISalesServiceVC.h"
#import "HSDisplayInfo.h"
#import "HSCISalesServiceSubVC.h"

@interface HSCISalesServiceVC ()

@property(nonatomic,strong) NSMutableArray *introductions;

@end

@implementation HSCISalesServiceVC

- (void)viewDidLoad {
    self.titleText = @"Sales/Service Stations";
    // Dummy TODO
    _introductions = [NSMutableArray arrayWithCapacity:4];
    for (int i=0;i<4;i++) {
        HSDisplayInfo *entity = [[HSDisplayInfo alloc] init];
        entity.image = @"dummy.jpg";
        entity.title = [NSString stringWithFormat:@"%d", i ];
        entity.btnText = [NSString stringWithFormat:@"%d", i ];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        for (int k=0; k<10; k++) {
            HSDisplayInfo *e = [[HSDisplayInfo alloc] init];
            e.image = @"dummy2.jpg";
            e.title = [NSString stringWithFormat:@"%d", k ];
            e.btnText = [NSString stringWithFormat:@"%d", k ];
            [array addObject:e];
            
        }
        entity.subInfos = array;
        [_introductions addObject:entity];
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) addSubviews {
    [super addSubviews];
    
    // TODO
    self.mainView.layer.contents = (id)[UIImage imageNamed:@""].CGImage;
    
    // Buttons
    NSInteger count = _introductions.count;
    for (int i=0; i<count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [self.optView addSubview:btn];
        HSDisplayInfo *ci = _introductions[i];
        btn.layer.borderWidth = 1.5;
        btn.backgroundColor = [UIColor blackColor];
        [btn setTitleColor:HS_COLOR_BTN_BORDER_HSCICompanyProfileVC forState:UIControlStateNormal];
        [btn sizeToFit];
        [btn setTitle:ci.btnText forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
        [btn makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.optView.centerX);
            make.size.equalTo(CGSizeMake(143, 33));
            make.top.equalTo(self.optView.top).offset(17 + 50 * i);
        }];
    }
}

- (void) click:(UIButton *) sender {
    HSDisplayInfo *info = _introductions[sender.tag];
    HSCISalesServiceSubVC *subVC = [[HSCISalesServiceSubVC alloc] init];
    subVC.infos = info.subInfos;
    subVC.image = info.image;
    [self.navigationController pushViewController:subVC animated:YES];
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
