//
//  CHTCollectionViewCell.m
//  StoreHouseUISample003
//
//  Created by 業務委託スタッフ on 2015/05/19.
//  Copyright (c) 2015年 msano. All rights reserved.
//

#import "CHTCollectionViewCell.h"

@implementation CHTCollectionViewCell

- (void)dealloc {
    [_titleLabel removeFromSuperview];
    _titleLabel = nil;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.displayLabel];
    }
    return self;
}

#pragma mark - Accessors
- (UILabel *)displayLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _titleLabel.backgroundColor = [UIColor lightGrayColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
