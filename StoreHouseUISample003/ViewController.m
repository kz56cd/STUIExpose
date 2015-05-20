//
//  ViewController.m
//  StoreHouseUISample003
//
//  Created by 業務委託スタッフ on 2015/05/19.
//  Copyright (c) 2015年 msano. All rights reserved.
//

#import "ViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "CHTCollectionViewWaterfallHeader.h"
#import "CHTCollectionViewCell.h"
#import "SlideImageViewController.h"


@interface ViewController () <CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource, CHTCollectionViewWaterfallHeaderDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray *cellList;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareCollectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareCollectionView {
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.headerHeight                      = 180.0f;
    layout.headerInset                       = UIEdgeInsetsMake(10.0f, 0.0f, 10.0f, 0.0f);
    _collectionView.collectionViewLayout     = layout;
    _collectionView.delegate                 = self;
    _collectionView.dataSource               = self;
    
    // read xib
    [self.collectionView registerNib:[UINib nibWithNibName:@"CHTCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CHTCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CHTCollectionViewWaterfallHeader" bundle:nil]
          forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CHTHeader"];
}


#pragma mark - Gesture Action


- (IBAction)pinchGestureCatched:(id)sender {
    NSLog(@"pinched!!! (on the collectionView.)");
}


#pragma mark - CHTCollectionViewDelegateWaterfallLayout & UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        CHTCollectionViewWaterfallHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CHTHeader" forIndexPath:indexPath];
        headerView.delegate = self;
        
        if ((int)indexPath.section == 1) {
            headerView.headerImageView.hidden = YES;
            headerView.headerTextView.hidden  = NO;
        } else {
            headerView.headerImageView.hidden = NO;
            headerView.headerTextView.hidden  = YES;
        }
        return headerView;
    } else {
        return nil;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else if (section == 1) {
        return 0;
    } else if(section == 2) {
        return 14;
    } else if(section == 3) {
        return 16;
    } else {
        return 30;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CHTCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CHTCell" forIndexPath:indexPath];
    cell.cellImage.image = [UIImage imageNamed:@"img_bill001"];
    
    if ((int)indexPath.row == 4 || (int)indexPath.row == 0) {
        cell.backgroundColor = [UIColor yellowColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ((int)indexPath.row == 4 || (int)indexPath.row == 0) {
        return CGSizeMake(180.0f, 370.0f);
    } else {
        return CGSizeMake(180.0f, 180.0f);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tapped cell : %d" , (int)indexPath.section);
    [self moveSlideShow];
}


#pragma mark - CHTCollectionViewWaterfallHeaderDelegate


- (void)headerTapped {
    [self moveSlideShow];
}


#pragma mark - private


- (void)moveSlideShow {
    SlideImageViewController *slideImageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SlideImageViewController"];
    [self presentViewController:slideImageViewController animated:YES completion:nil];
}




@end
