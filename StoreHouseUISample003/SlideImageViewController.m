//
//  SlideImageViewController.m
//  StoreHouseUISample003
//
//  Created by 業務委託スタッフ on 2015/05/20.
//  Copyright (c) 2015年 msano. All rights reserved.
//

#import "SlideImageViewController.h"
#import "OneSlideView.h"

@interface SlideImageViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *oneSlideView;
@property (nonatomic) BOOL didAddSlides;

@end

@implementation SlideImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _didAddSlides = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"_scrollView.contentSize : %@" , NSStringFromCGSize(_scrollView.contentSize));
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addSlides];
    [self.view layoutIfNeeded];
}

- (void)addSlides {
    if (_didAddSlides == NO) {
        dispatch_async(dispatch_get_main_queue(), ^{
            _didAddSlides = YES;
            int viewWidth  = 0;
            for (int i = 0; i <= 10; i++) {
                NSLog(@"add view");
                OneSlideView *view = [[OneSlideView alloc] initWithFrame:CGRectMake(viewWidth, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
                [view addImage:view.bounds.size];
                viewWidth += view.bounds.size.width;
                [_scrollView addSubview:view];
            }
            _scrollView.contentSize = CGSizeMake(viewWidth, _scrollView.bounds.size.height);
        });
    }
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
