//
//  HSProjectView.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSProjectView.h"
#import "HSLabel.h"
#import "HSViewUtil.h"
#import "HSCPProjectVC.h"

@interface HSProjectView ()

@property(nonatomic,strong) UIImageView *projectImage;
@property(nonatomic,strong) HSLabel *detailLabel;

@end

@implementation HSProjectView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        _projectImage = [[UIImageView alloc] init];
        _detailLabel = [[HSLabel alloc] init];
    }
    return self;
}

- (void) layoutSubviews {
    self.backgroundColor = [UIColor clearColor];
    
    // Image
    [self addSubview:_projectImage];
    _projectImage.image = [UIImage imageNamed:_project.image];
    _projectImage.backgroundColor = [UIColor whiteColor];
    [_projectImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.height.equalTo(138);
    }];
    
    // description
    [self addSubview:_detailLabel];
    [_detailLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.top.equalTo(_projectImage.bottom).offset(4);
        make.height.equalTo(32);
    }];
    _detailLabel.backgroundColor = [UIColor whiteColor];
    _detailLabel.text = [_project.name stringByAppendingFormat:@",%@",_project.country];
    _detailLabel.numberOfLines = 0;
    _detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _detailLabel.textColor = [UIColor blackColor];
    _detailLabel.font = [UIFont systemFontOfSize:10];
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    
    // Click event
    UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tapGesture];
}

- (void) click {
    UIViewController *currentVC = [HSViewUtil findViewController:self];
    HSCPProjectVC *pVC = [[HSCPProjectVC alloc] init];
    pVC.project = _project;
    [currentVC.navigationController pushViewController:pVC animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
