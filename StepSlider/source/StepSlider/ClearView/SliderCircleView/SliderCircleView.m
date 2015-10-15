//
//  SliderCircleView.m
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import "SliderCircleView.h"
#import "StepSlider.h"

@implementation SliderCircleView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat cornerRadius = self.bounds.size.height / 2.0;
    UIBezierPath *switchOutline = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                             cornerRadius:cornerRadius];
    CGContextAddPath(ctx, switchOutline.CGPath);
    CGContextClip(ctx);
    
    CGContextSetFillColorWithColor(ctx, self.sliderView.sliderCircleColor.CGColor);
    CGContextAddPath(ctx, switchOutline.CGPath);
    CGContextFillPath(ctx);
}

@end
