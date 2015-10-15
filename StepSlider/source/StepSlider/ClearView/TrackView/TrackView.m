//
//  TrackView.m
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import "TrackView.h"
#import "StepSlider.h"

@implementation TrackView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctx, self.sliderView.trackColor.CGColor);
    CGContextAddPath(ctx, [UIBezierPath bezierPathWithRect:self.bounds].CGPath);
    CGContextFillPath(ctx);
    
    CGFloat fillWidth = self.bounds.size.width / (self.sliderView.maxCount - 1) * self.sliderView.stepIndex;
    CGRect fillRect = CGRectMake(0.f, 0.f, fillWidth, self.bounds.size.height);
    CGContextSetFillColorWithColor(ctx, self.sliderView.tintColor.CGColor);
    CGContextAddPath(ctx, [UIBezierPath bezierPathWithRect:fillRect].CGPath);
    CGContextFillPath(ctx);
}

@end
