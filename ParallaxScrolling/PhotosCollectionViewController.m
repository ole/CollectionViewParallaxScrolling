//
//  PhotosCollectionViewController.m
//  ParallaxScrolling
//
//  Created by Ole Begemann on 01.05.14.
//  Copyright (c) 2014 Ole Begemann. All rights reserved.
//

#import "PhotosCollectionViewController.h"
#import "ParallaxLayout.h"
#import "ParallaxPhotoCell.h"

@interface PhotosCollectionViewController ()

@property (nonatomic, copy) NSArray *photos;

@end


@implementation PhotosCollectionViewController

- (id)init
{
    ParallaxLayout *layout = [[ParallaxLayout alloc] init];
    layout.itemSize = CGSizeMake(320, 240);
    layout.minimumLineSpacing = 40;
    self = [super initWithCollectionViewLayout:layout];
    
    if (self == nil) {
        return nil;
    }
    
    self.title = @"Photos";
    NSDictionary *photosDict = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"plist"]];
    self.photos = photosDict[@"photos"];
    
    return self;
}

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[ParallaxPhotoCell class] forCellWithReuseIdentifier:@"PhotoCell"];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParallaxPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    NSString *photoFilename = self.photos[indexPath.item][@"filename"];
    UIImage *photo = [UIImage imageNamed:photoFilename];
    cell.imageView.image = photo;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat imageWidth = [self.photos[indexPath.item][@"width"] floatValue];
    CGFloat imageHeight = [self.photos[indexPath.item][@"height"] floatValue];
    
    CGFloat cellWidth = CGRectGetWidth(self.collectionView.bounds);
    CGFloat cellHeight = floor(cellWidth / imageWidth * imageHeight);
    return CGSizeMake(cellWidth, cellHeight);
}

@end
