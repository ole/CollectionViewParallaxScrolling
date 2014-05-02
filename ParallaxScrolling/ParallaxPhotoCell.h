//
//  ParallaxPhotoCell.h
//  ParallaxScrolling
//
//  Created by Ole Begemann on 01.05.14.
//  Copyright (c) 2014 Ole Begemann. All rights reserved.
//

@import UIKit;

@interface ParallaxPhotoCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic) CGFloat maxParallaxOffset;

@end
