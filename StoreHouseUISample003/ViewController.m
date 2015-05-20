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
#import "ModCollectionReusableView.h"


@interface ViewController () <CHTCollectionViewDelegateWaterfallLayout, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSArray *cellList;
//@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end

//@implementation ViewController <CHTCollectionViewDelegateWaterfallLayout>
@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    layout.headerHeight = 180.0f;
    layout.headerInset = UIEdgeInsetsMake(10.0f, 0.0f, 10.0f, 0.0f);
    _collectionView.collectionViewLayout = layout;
    
    _collectionView.delegate             = self;
    _collectionView.dataSource           = self;
    
    
//    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    
//    UINib *nib = [UINib nibWithNibName:@"ModCollectionReusableView" bundle:nil];
//    [_collectionView registerNib:nib forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
    
//    [_collectionView registerClass:[ModCollectionReusableView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
    
//    [self.collectionView registerClass:[CHTCollectionViewCell class]
//            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CHTCell"];


// ok
    
//    [self.collectionView registerClass:[CHTCollectionViewCell class]
//            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"Cell"];
//    [self.collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
//            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CHTHeader"];

    [self.collectionView registerNib:[UINib nibWithNibName:@"CHTCollectionViewWaterfallHeader" bundle:nil]
          forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CHTHeader"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
//        CHTCollectionViewWaterfallHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CHTHeader" forIndexPath:indexPath];
        CHTCollectionViewWaterfallHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"CHTHeader" forIndexPath:indexPath];

        if ((int)indexPath.section == 1) {
            headerView.headerImageView.hidden = YES;
            headerView.headerTextView.hidden  = NO;
        } else {
            headerView.headerImageView.hidden = NO;
            headerView.headerTextView.hidden  = YES;
        }
        
        //    headerView.label.text = [self.titles objectAtIndex:indexPath.section];
    //    headerView.backgroundColor = [UIColor blueColor];
        return headerView;
    } else {
        return nil;
    }
}


//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
////    if (kind == UICollectionElementKindSectionHeader) {
////        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//////        NSArray *titles = @[@"Red",@"Blue",@"Yellow"];
//////        headerView.titleLabel.text = titles[ indexPath.section ];
////        return headerView;
////    } else {
////        return nil;
////    }
//    
//    UICollectionReusableView *reusableView = nil;
//    
////    if (kind == UICollectionElementKindSectionHeader) {
////        
////        UINib *nib = [UINib nibWithNibName:@"headerCollectionViewCell" bundle:nil];
////        
////        [collectionViews registerNib:nib forCellWithReuseIdentifier:@"headerCell"];
////        
////        headerCollectionViewCell *collectionHeader = [collectionViews dequeueReusableCellWithReuseIdentifier:@"headerCell" forIndexPath:indexPath];
////        collectionHeader.titleLabel.text = @"What";
////        
////        reusableView = collectionHeader;
////    }
//    
//    return reusableView;
//}


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
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if ((int)indexPath.row == 4 || (int)indexPath.row == 0) {
        cell.backgroundColor = [UIColor yellowColor];
    } else {
        cell.backgroundColor = [UIColor blueColor];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    if ((int)indexPath.row % 2 == 0) {
    //        return CGSizeMake(370.0f, 160.0f);
    //    } else
    //
    //    if ((int)indexPath.row % 3 == 0) {
    
    
    
    if ((int)indexPath.row == 4 || (int)indexPath.row == 0) {
        return CGSizeMake(180.0f, 370.0f);
//    } else if ((int)indexPath.row == 18) {
//        return CGSizeMake(370.0f, 180.0f);
    } else {
        return CGSizeMake(180.0f, 180.0f);
    }
}



// ------------------



//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    
//}


@end
