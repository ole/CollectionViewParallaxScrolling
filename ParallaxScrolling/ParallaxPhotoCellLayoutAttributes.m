//
//  ParallaxPhotoCellLayoutAttributes.m
//  ParallaxScrolling
//
//  Created by Ole Begemann on 01.05.14.
//  Copyright (c) 2014 Ole Begemann. All rights reserved.
//

#import "ParallaxPhotoCellLayoutAttributes.h"

@implementation ParallaxPhotoCellLayoutAttributes

- (id)copyWithZone:(NSZone *)zone
{
    ParallaxPhotoCellLayoutAttributes *copy = [super copyWithZone:zone];
    NSAssert([copy isKindOfClass:[self class]], @"copy must have the same class");
    copy.parallaxOffset = self.parallaxOffset;
    return copy;
}

- (BOOL)isEqual:(id)object
{
    ParallaxPhotoCellLayoutAttributes *otherObject = object;
    if (!CGPointEqualToPoint(self.parallaxOffset, otherObject.parallaxOffset)) {
        return NO;
    }
    return [super isEqual:otherObject];
}

@end
