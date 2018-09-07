//
//  ViewController.m
//  yogakitDemo
//
//  Created by 刘小二 on 2018/9/6.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import "ViewController.h"
#import <YogaKit/YGLayout.h>
#import <YogaKit/UIView+Yoga.h>
#import "TestHeightTableViewCell.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 顶部导航
    [self initViews];
    
}

- (void)initViews {
    [self setupTopNav];
    [self setupTableView];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);

}

- (void)viewWillLayoutSubviews {
    
    [self.view.yoga applyLayoutPreservingOrigin:NO];
    [self.tableView reloadData];
}

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.tableView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexGrow = 1;
    }];
    [self.view addSubview:self.tableView];
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor yellowColor];
    [headerView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexDirection = YGFlexDirectionRow;
        yoga.alignItems = YGAlignCenter;
        yoga.paddingLeft = yoga.paddingRight = YGPointValue(10);
    }];
    self.tableView.tableHeaderView = headerView;
    
    UIView *headerWrapper = [UIView new];
    headerWrapper.layer.cornerRadius = 5;
    [headerWrapper configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.paddingTop = yoga.paddingBottom = YGPointValue(20);
        yoga.marginTop = yoga.marginBottom = YGPointValue(10);
        yoga.width = YGPercentValue(100);
        yoga.flexDirection = YGFlexDirectionRow;
        yoga.alignItems = YGAlignCenter;
        yoga.paddingLeft = yoga.paddingRight = YGPointValue(20);
    }];
    headerWrapper.backgroundColor = [UIColor cyanColor];
    [headerView addSubview:headerWrapper];
    
    
    UIImageView *avatarView = [UIImageView new];
    avatarView.backgroundColor = [UIColor blackColor];
    avatarView.layer.cornerRadius = 55/2;
    [avatarView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.width = YGPointValue(55);
        yoga.aspectRatio = 1;
    }];
    [headerWrapper addSubview:avatarView];
    
    UILabel *userNameLabel = [UILabel new];
    userNameLabel.numberOfLines = 2;
    [headerWrapper addSubview:userNameLabel];
    [userNameLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexShrink = 1;
        yoga.flexGrow = 1;
        yoga.alignSelf = YGAlignFlexStart;
        yoga.marginTop = YGPointValue(10);
        yoga.marginLeft = YGPointValue(10);
        yoga.marginRight = YGPointValue(5);
    }];
    userNameLabel.text = @"都能死啊dsadsadasdasdasdas大家";
    [userNameLabel sizeToFit];
    
    UIImageView *arrowView = [UIImageView new];
    arrowView.backgroundColor = [UIColor redColor];
    [headerWrapper addSubview:arrowView];
    [arrowView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.width = yoga.height = YGPointValue(20);
    }];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#if DEBUG
- (void)injected {
    for (UIView *v in self.view.subviews) {
        [v removeFromSuperview];
    }
    [self initViews];
}
#endif



- (void)setupTopNav {
    
    [self.view configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexDirection = YGFlexDirectionColumn;
    }];
    
    
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:contentView];
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.height = YGPointValue(64);
        yoga.paddingTop = YGPointValue(20);
        yoga.alignItems = YGAlignCenter;
        yoga.paddingLeft = yoga.paddingRight = YGPointValue(10);
        yoga.flexDirection = YGFlexDirectionRow;
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"我的";
    titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    titleLabel.backgroundColor = [UIColor yellowColor];
    [contentView addSubview:titleLabel];
    [titleLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexGrow = 1;
    }];
    titleLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click)];
    [titleLabel addGestureRecognizer:tap];
    
    UIImageView *scanView = [UIImageView new];
    scanView.backgroundColor = [UIColor brownColor];
    [contentView addSubview:scanView];
    [scanView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.height = YGPointValue(30);
        yoga.width = YGPointValue(30);
        yoga.marginLeft = yoga.marginRight = YGPointValue(10);
        yoga.aspectRatio = 1;
    }];
    
    UIImageView *msgView = [UIImageView new];
    msgView.backgroundColor = [UIColor redColor];
    [contentView addSubview:msgView];
    [msgView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.width = YGPointValue(30);
        yoga.aspectRatio = 1;
    }];
}
- (void)click {
    NSLog(@"hello world 2");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ids = @"id";
    TestHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ids];
    if (cell == nil) {
        cell = [[TestHeightTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ids];
    }
    cell.indexPath = indexPath;
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 110;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
