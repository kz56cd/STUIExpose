//
//  CHTCollectionViewWaterfallHeader.m
//  StoreHouseUISample003
//
//  Created by 業務委託スタッフ on 2015/05/19.
//  Copyright (c) 2015年 msano. All rights reserved.
//

#import "CHTCollectionViewWaterfallHeader.h"

@implementation CHTCollectionViewWaterfallHeader

- (void)awakeFromNib {
}

- (IBAction)btnTapped:(id)sender {
    // 画像のときのみdelgateとばす
    if (_headerImageView.hidden == NO) {
        [self.delegate headerTapped];
    }
}



@end
