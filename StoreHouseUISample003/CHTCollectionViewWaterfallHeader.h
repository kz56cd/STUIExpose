//
//  CHTCollectionViewWaterfallHeader.h
//  StoreHouseUISample003
//
//  Created by 業務委託スタッフ on 2015/05/19.
//  Copyright (c) 2015年 msano. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CHTCollectionViewWaterfallHeaderDelegate <NSObject>

- (void)headerTapped;

@end

@interface CHTCollectionViewWaterfallHeader : UICollectionReusableView

@property (nonatomic, weak) id<CHTCollectionViewWaterfallHeaderDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UITextView *headerTextView;

@end
