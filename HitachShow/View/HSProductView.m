//
//  HSProductView.m
//  HitachShow
//
//  Created by Jeremy on 2016.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSProductView.h"
#import "HSVideoPlayVC.h"
#import "HSViewUtil.h"
#import "HSPreviewVC.h"

@interface HSProductView ()

@property(nonatomic,strong) UIImageView *productImage;
@property(nonatomic,strong) UIButton *pdfBtn;
@property(nonatomic,strong) UIButton *pptBtn;
@property(nonatomic,strong) UIButton *videoBtn;
@property(nonatomic,strong) UILabel *nameLabel;
@property(nonatomic,strong) UILabel *detailLabel;
@property(nonatomic,strong) UILabel *remarkLabel;

@end

@implementation HSProductView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        _productImage = [[UIImageView alloc] init];
        [self addSubview:_productImage];
        _pdfBtn = [[UIButton alloc] init];
        [self addSubview:_pdfBtn];
        _pptBtn = [[UIButton alloc] init];
        [self addSubview:_pptBtn];
        _videoBtn = [[UIButton alloc] init];
        [self addSubview:_videoBtn];
        _nameLabel = [[UILabel alloc] init];
        [self addSubview:_nameLabel];
        _detailLabel = [[UILabel alloc] init];
        [self addSubview:_detailLabel];
        _remarkLabel = [[UILabel alloc] init];
        [self addSubview:_remarkLabel];
    }
    self.backgroundColor = [UIColor blackColor];
    return self;
}

- (void) layoutSubviews {
    // Product image
    _productImage.backgroundColor = [UIColor grayColor];
    _productImage.image = _image;
    [_productImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.bottom.equalTo(self.bottom).offset(-90);
    }];
    
    // Show pdf
    [_pdfBtn addTarget:self action:@selector(showPDF) forControlEvents:UIControlEventTouchDown];
    _pdfBtn.backgroundColor = [UIColor clearColor];
    [_pdfBtn setImage:[UIImage imageNamed:@"pi_btn_pdf.png"] forState:UIControlStateNormal];
    [_pdfBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_productImage.bottom).offset(6);
        make.left.equalTo(self.left).offset(15);
        make.size.equalTo(CGSizeMake(33, 41));
    }];
    
    // Show ppt
    [_pptBtn addTarget:self action:@selector(showPPT) forControlEvents:UIControlEventTouchDown];
    _pptBtn.backgroundColor = [UIColor clearColor];
    [_pptBtn setImage:[UIImage imageNamed:@"pi_btn_ppt.png"] forState:UIControlStateNormal];
    [_pptBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pdfBtn.top);
        make.left.equalTo(_pdfBtn.right).offset(40);
        make.size.equalTo(CGSizeMake(41, 41));
    }];
    
    // Video play
    _videoBtn.backgroundColor = [UIColor clearColor];
    [_videoBtn setImage:[UIImage imageNamed:@"pi_btn_video.png"] forState:UIControlStateNormal];
    [_videoBtn addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchDown];
    [_videoBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_pptBtn.top);
        make.left.equalTo(_pptBtn.right).offset(40);
        make.size.equalTo(CGSizeMake(41, 41));
    }];
    
    // Product name
    _nameLabel.text = _productName;
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont systemFontOfSize:12];
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottom).offset(10);
        make.left.equalTo(self.left);
        make.right.equalTo(self.right);
        make.height.equalTo(17);
    }];
    
    // Detail eg. model
    if (_detail) {
        _detailLabel.text = _detail;
        _detailLabel.textColor = [UIColor blackColor];
        _detailLabel.font = [UIFont systemFontOfSize:16 weight:0.5];
        _detailLabel.backgroundColor = [UIColor clearColor];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        [_detailLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottom).offset(30);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.height.equalTo(22);
        }];
    }
    
    // Remark eg. category
    if (_remark) {
        _remarkLabel.text = _remark;
        _remarkLabel.textColor = [UIColor blackColor];
        _remarkLabel.font = [UIFont systemFontOfSize:16 weight:0.5];
        _remarkLabel.backgroundColor = [UIColor clearColor];
        _remarkLabel.textAlignment = NSTextAlignmentCenter;
        [_remarkLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottom).offset(55);
            make.left.equalTo(self.left);
            make.right.equalTo(self.right);
            make.height.equalTo(25);
        }];
    }
}

- (void) playVideo {
    if (!_videoPath) {return;}
    UIViewController *vc = [HSViewUtil findViewController:self];
    HSVideoPlayVC *videoVC = [[HSVideoPlayVC alloc] init];
    videoVC.videoPath = _videoPath;
    [vc presentViewController:videoVC animated:YES completion:nil];
}

- (void) showPPT {
    if (!_pptPath) {return;}
    [self previewWithPath:_pptPath];
}

- (void) showPDF {
    if (!_pdfPath) {return;}
    [self previewWithPath:_pdfPath];
}

- (void) previewWithPath:(NSString *) path {
    HSPreviewVC *preview = [[HSPreviewVC alloc] init];
    preview.filePath = path;
    UIViewController *vc = [HSViewUtil findViewController:self];
    [vc presentViewController:preview animated:YES completion:nil];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
