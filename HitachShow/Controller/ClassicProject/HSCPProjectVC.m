//
//  HSCPProjectVC.m
//  HitachShow
//
//  Created by Jeremy on 2016年.
//  Copyright (c) 2016年 hitach. All rights reserved.
//

#import "HSCPProjectVC.h"
#import "HSLabel.h"

@interface HSCPProjectVC () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) NSArray *keys;
@property(nonatomic,strong) NSArray *values;

@end

@implementation HSCPProjectVC

- (void)viewDidLoad {
    self.titleText = @"Project Gallery";
    [super viewDidLoad];

    _keys = [NSArray arrayWithObjects:@"Project Name",@"Distributor",@"Specification",@"Year of Completion", nil];
    _values = [NSArray arrayWithObjects:_project.name ,_project.distributor,_project.spec,_project.yearOfCompletion, nil];
}

- (void) addSubviews {
    [super addSubviews];
    
    // Country label
    HSLabel *countryLabel = [[HSLabel alloc] init];
    [self.view addSubview:countryLabel];
    countryLabel.text = _project.country;
    countryLabel.textColor = [UIColor whiteColor];
    countryLabel.font = [UIFont systemFontOfSize:24 weight:0.5];
    countryLabel.textAlignment = NSTextAlignmentCenter;
    [countryLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.optView.left);
        make.right.equalTo(self.optView.right);
        make.top.equalTo(self.optView.top).offset(33);
        make.height.equalTo(33);
    }];
    
    // Building use label
    HSLabel *useLabel = [[HSLabel alloc] init];
    [self.view addSubview:useLabel];
    useLabel.text = _project.use;
    useLabel.textColor = [UIColor whiteColor];
    useLabel.font = [UIFont systemFontOfSize:24 weight:0.5];
    useLabel.textAlignment = NSTextAlignmentCenter;
    [useLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.optView.left);
        make.right.equalTo(self.optView.right);
        make.top.equalTo(self.optView.top).offset(88);
        make.height.equalTo(33);
    }];
    
    // Project image
    UIImageView *projectImage = [[UIImageView alloc] init];
    [self.view addSubview:projectImage];
    projectImage.image = [UIImage imageNamed: _project.image];
    [projectImage makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mainView.centerX);
        make.size.equalTo(CGSizeMake(530, 403));
        make.top.equalTo(self.mainView.top).offset(35);
    }];
    projectImage.backgroundColor = [UIColor whiteColor];
    
    //Project detail
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 10;
    UICollectionView *collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    collectionView.dataSource=self;
    collectionView.delegate=self;
    [collectionView setBackgroundColor:[UIColor clearColor]];
    collectionView.layer.borderColor = [UIColor whiteColor].CGColor;
    collectionView.layer.borderWidth = 1;
    collectionView.scrollEnabled = NO;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(550, 180));
        make.top.equalTo(projectImage.bottom).offset(35);
        make.left.equalTo(self.view.left).offset(35);
    }];
    
    HSLabel *clientLabel = [[HSLabel alloc] init];
    [self.view addSubview:clientLabel];
    [clientLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(collectionView.right).offset(-1);
        make.top.equalTo(collectionView.top);
        make.bottom.equalTo(collectionView.bottom);
        make.right.equalTo(self.mainView.right).offset(-35);
    }];
    clientLabel.layer.borderWidth = 1;
    clientLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    clientLabel.text = @"Courtesy of Civil Aviation authority of Singapore";
    clientLabel.font = [UIFont systemFontOfSize:14];
    clientLabel.backgroundColor = [UIColor clearColor];
    clientLabel.textAlignment = NSTextAlignmentCenter;
    clientLabel.textColor = [UIColor whiteColor];
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    CGFloat width = 120;
    HSLabel *keyLabel = [[HSLabel alloc] init];
    [cell addSubview:keyLabel];
    [keyLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.left);
        make.top.equalTo(cell.top);
        make.bottom.equalTo(cell.bottom);
        make.width.equalTo(width);
    }];
    keyLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    keyLabel.layer.borderWidth = 0.5;
    keyLabel.text = _keys[indexPath.section];
    keyLabel.textColor = [UIColor whiteColor];
    keyLabel.textAlignment = NSTextAlignmentCenter;
    keyLabel.backgroundColor = [UIColor clearColor];
    keyLabel.font = [UIFont systemFontOfSize:12];
    
    HSLabel *valueLabel = [[HSLabel alloc] init];
    [cell addSubview:valueLabel];
    [valueLabel makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(cell.right);
        make.top.equalTo(cell.top);
        make.bottom.equalTo(cell.bottom);
        make.width.equalTo(collectionView.frame.size.width - width);
    }];
    valueLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    valueLabel.layer.borderWidth = 0.5;
    valueLabel.text = _values[indexPath.section];
    valueLabel.textColor = [UIColor whiteColor];
    valueLabel.textAlignment = NSTextAlignmentCenter;
    valueLabel.backgroundColor = [UIColor clearColor];
    valueLabel.font = [UIFont systemFontOfSize:12];
    
    cell.layer.borderWidth = 0.5;
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat baseHeight = collectionView.frame.size.height/5;
    CGFloat cellHeight = baseHeight;
    if (indexPath.section == 0) {
        cellHeight = baseHeight*2;
    }

    return CGSizeMake(550, cellHeight);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

#pragma mark --UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    // NOP
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
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
