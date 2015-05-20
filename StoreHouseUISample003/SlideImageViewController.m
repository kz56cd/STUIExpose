//
//  SlideImageViewController.m
//  StoreHouseUISample003
//
//  Created by 業務委託スタッフ on 2015/05/20.
//  Copyright (c) 2015年 msano. All rights reserved.
//

#import "SlideImageViewController.h"

@interface SlideImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation SlideImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Gesture Action

// MARK: 現在停止中
- (IBAction)tapGestureCatched:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIScrollViewDelegate


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scroll");
}

@end
