//
//  GameCell.m
//  h5game
//
//  Created by wangpeng on 17/6/23.
//  Copyright © 2017年 h5game. All rights reserved.
//

#import "GameCell.h"
#import "Masonry.h"

@implementation GameCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupsubviews];
    }
    return self;
}

- (void)setupsubviews {
    [self.contentView addSubview:self.iconView];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(60);
    }];
    
    [self.contentView addSubview:self.showLabel];
    [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconView.mas_right).offset(10);
        make.top.mas_equalTo(self.iconView).offset(3);
    }];
    
    [self.contentView addSubview:self.detailShowLabel];
    [self.detailShowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.showLabel);
        make.bottom.mas_equalTo(self.iconView).offset(-3);
    }];
}

#pragma mark - lazy getter
- (UILabel *)detailShowLabel {
    if (!_detailShowLabel) {
        _detailShowLabel = [[UILabel alloc] init];
        _detailShowLabel.font = [UIFont systemFontOfSize:13];
    }
    return _detailShowLabel;
}
- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] init];
    }
    return _showLabel;
}
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.backgroundColor = [UIColor redColor];
        _iconView.layer.cornerRadius = 8;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}
@end
