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

@property (nonatomic, copy) NSArray *photoFilenames;

@end


@implementation PhotosCollectionViewController

- (id)init
{
    ParallaxLayout *layout = [[ParallaxLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    
    if (self == nil) {
        return nil;
    }
    
    NSDictionary *photosDict = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Photos" withExtension:@"plist"]];
    self.photoFilenames = photosDict[@"photos"];
    
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
    return [self.photoFilenames count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParallaxPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    
    NSString *photoFilename = self.photoFilenames[indexPath.item];
    UIImage *photo = [UIImage imageNamed:photoFilename];
    cell.imageView.image = photo;
    
    return cell;
}

@end
