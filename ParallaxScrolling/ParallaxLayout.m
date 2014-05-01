//
//  ParallaxLayout.m
//  ParallaxScrolling
//
//  Created by Ole Begemann on 01.05.14.
//  Copyright (c) 2014 Ole Begemann. All rights reserved.
//

#import "ParallaxLayout.h"
#import "ParallaxPhotoCellLayoutAttributes.h"

@implementation ParallaxLayout

+ (Class)layoutAttributesClass
{
    return [ParallaxPhotoCellLayoutAttributes class];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *layoutAttributesArray = [super layoutAttributesForElementsInRect:rect];
    for (ParallaxPhotoCellLayoutAttributes *layoutAttributes in layoutAttributesArray) {
        layoutAttributes.offsetFromCenter = [self centerOffsetForLayoutAttributes:layoutAttributes];
    }
    return layoutAttributesArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParallaxPhotoCellLayoutAttributes *layoutAttributes = (ParallaxPhotoCellLayoutAttributes *)[super layoutAttributesForItemAtIndexPath:indexPath];
    layoutAttributes.offsetFromCenter = [self centerOffsetForLayoutAttributes:layoutAttributes];
    return layoutAttributes;
}

- (CGPoint)centerOffsetForLayoutAttributes:(ParallaxPhotoCellLayoutAttributes *)layoutAttributes
{
    NSParameterAssert(layoutAttributes != nil);
    NSParameterAssert([layoutAttributes isKindOfClass:[ParallaxPhotoCellLayoutAttributes class]]);
    
    CGRect bounds = self.collectionView.bounds;
    CGPoint boundsCenter = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
    CGPoint cellCenter = layoutAttributes.center;
    CGPoint offsetFromCenter = CGPointMake(boundsCenter.x - cellCenter.x, boundsCenter.y - cellCenter.y);
    return offsetFromCenter;
}

@end
