//
//  TestHeightTableViewCell.m
//  yogakitDemo
//
//  Created by 刘小二 on 2018/9/6.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import "TestHeightTableViewCell.h"
#import <YogaKit/YGLayout.h>
#import <YogaKit/UIView+Yoga.h>
@interface TestHeightTableViewCell()
@property(nonatomic,strong) UIImageView *iconView;
@property(nonatomic,strong) UILabel *contentLabel;
@property(nonatomic,strong) UILabel *subTitleLabel;
@property(nonatomic,strong) NSArray *items;
@end
@implementation TestHeightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)initViews {
    
    [self.contentView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexDirection = YGFlexDirectionRow;
        yoga.alignItems = YGAlignCenter;
    }];
    
    UIImageView *iconView = [UIImageView new];
    iconView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconView];
    [iconView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.width = YGPointValue(110);
        yoga.aspectRatio = 1.1;
        yoga.marginLeft = yoga.marginBottom = yoga.marginTop = YGPointValue(10);
    }];
    self.iconView = iconView;
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.numberOfLines = 0;
    contentLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:contentLabel];
    [contentLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexGrow = 1;
        yoga.flexShrink = 1;
        yoga.alignSelf = YGAlignFlexStart;
        yoga.marginTop = YGPointValue(20);
        yoga.marginLeft = yoga.marginRight = YGPointValue(10);
        yoga.maxHeight = YGPercentValue(85);
    }];
    self.contentLabel = contentLabel;
    
    UILabel *subTitleLabel = [UILabel new];
    subTitleLabel.numberOfLines = 1;
    subTitleLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:subTitleLabel];
    [subTitleLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
    }];
    subTitleLabel.text = @"你好helloworld";
    [subTitleLabel sizeToFit];
    self.subTitleLabel = subTitleLabel;

}
- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    
    self.contentLabel.text = self.items[indexPath.row];
    [self.contentLabel sizeToFit];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority {
    return [self.contentView.yoga calculateLayoutWithSize:CGSizeMake(targetSize.width, MAXFLOAT)];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.contentView.yoga applyLayoutPreservingOrigin:NO];
}

- (NSArray *)items {
    if (!_items) {
        _items = @[@"的撒娇的健身卡逻辑电路刷卡机大家撒劳动纪律撒娇地拉收到了",@"的撒和大家撒还记得看哈数据库等回家撒客户登记卡还是大家看撒谎尽快的哈接口和大家奥斯卡和登记卡仕达尽快哈市将",@"dsankdjad",@"的撒谎的教案上登记卡还是打开就好撒即可到黄金卡刷卡的环境阿克苏",@"2313的撒娇的垃圾爱死了大家按时间段萨达来得及撒开了较大手机端快捷奥斯卡大家按实际的卡拉是基督教奥斯卡登记卡时间段卡时间段卡接收到卡即可打死了撒开了就打开的撒娇大家撒开了家的快乐撒娇大师级的卡拉加大零售价大街上的骄傲是可敬的卡死机读卡机刷卡来得及撒娇了"];
    }
    return _items;
}

@end
