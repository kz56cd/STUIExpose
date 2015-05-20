//
//  OneSlideView.m
//  StoreHouseUISample003
//
//  Created by 業務委託スタッフ on 2015/05/20.
//  Copyright (c) 2015年 msano. All rights reserved.
//

#import "OneSlideView.h"

@implementation OneSlideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"a view");
}

- (void)addImage:(CGSize)size {
    UIImageView *imageView    = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_bill001"]];
    imageView.contentMode     = UIViewContentModeScaleAspectFit;
    imageView.frame           = CGRectMake(0, 0, size.width, size.height);
    imageView.backgroundColor = [UIColor blackColor];
    [self addSubview:imageView];
    NSLog(@"imageView.bounds.size : %@" , NSStringFromCGSize(imageView.frame.size));
}

@end
