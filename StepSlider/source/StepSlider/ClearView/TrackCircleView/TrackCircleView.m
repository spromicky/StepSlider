//
//  TrackCircleView.m
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import "TrackCircleView.h"
#import "StepSlider.h"

@implementation TrackCircleView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat cornerRadius = self.bounds.size.height / 2.0;
    UIBezierPath *switchOutline = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                             cornerRadius:cornerRadius];
    CGContextAddPath(ctx, switchOutline.CGPath);
    CGContextClip(ctx);
    
    CGColorRef colorToFill = self.selected ? self.sliderView.tintColor.CGColor : self.sliderView.trackColor.CGColor;
    CGContextSetFillColorWithColor(ctx, colorToFill);
    CGContextAddPath(ctx, switchOutline.CGPath);
    CGContextFillPath(ctx);
}

@end
