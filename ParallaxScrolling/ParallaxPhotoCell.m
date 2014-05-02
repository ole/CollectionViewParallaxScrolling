//
//  ParallaxPhotoCell.m
//  ParallaxScrolling
//
//  Created by Ole Begemann on 01.05.14.
//  Copyright (c) 2014 Ole Begemann. All rights reserved.
//

#import "ParallaxPhotoCell.h"
#import "ParallaxPhotoCellLayoutAttributes.h"

@interface ParallaxPhotoCell ()

@property (nonatomic) BOOL didSetupConstraints;
@property (nonatomic, strong) NSLayoutConstraint *imageViewHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *imageViewCenterYConstraint;

@end

@implementation ParallaxPhotoCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) {
        return nil;
    }

    self.clipsToBounds = YES;

    [self setupImageView];
    [self setupConstraints];
    [self setNeedsUpdateConstraints];
    
    return self;
}

- (void)setupImageView
{
    _imageView = [[UIImageView alloc] initWithImage:nil];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_imageView];
}

- (void)updateConstraints
{
    [super updateConstraints];
    
    if (!self.didSetupConstraints) {
        self.imageView.translatesAutoresizingMaskIntoConstraints = NO;

        // Horizontal constraints for image view
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
        
        // Vertical constraints for image view
        self.imageViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
        self.imageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
        [self.contentView addConstraint:self.imageViewHeightConstraint];
        [self.contentView addConstraint:self.imageViewCenterYConstraint];
        
        self.didSetupConstraints = YES;
    }
    
    // Make sure image view is tall enough to cover maxParallaxOffset in both directions
    self.imageViewHeightConstraint.constant = 2 * self.maxParallaxOffset;
}

- (void)setMaxParallaxOffset:(CGFloat)maxParallaxOffset
{
    _maxParallaxOffset = maxParallaxOffset;
    [self setNeedsUpdateConstraints];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    NSParameterAssert(layoutAttributes != nil);
    NSParameterAssert([layoutAttributes isKindOfClass:[ParallaxPhotoCellLayoutAttributes class]]);

    ParallaxPhotoCellLayoutAttributes *parallaxLayoutAttributes = (ParallaxPhotoCellLayoutAttributes *)layoutAttributes;
    self.imageViewCenterYConstraint.constant = parallaxLayoutAttributes.parallaxOffset.y;
}

@end
