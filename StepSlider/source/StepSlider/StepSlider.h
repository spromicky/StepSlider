//
//  StepSlider.h
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface StepSlider : UIControl

@property (nonatomic) NSUInteger maxCount;
@property (nonatomic) NSUInteger index;

@property (nonatomic) CGFloat trackHeight;
@property (nonatomic) CGFloat trackCircleRadius;
@property (nonatomic) CGFloat sliderCircleRadius;

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *sliderCircleColor;

- (CGFloat)sliderPosition;
- (CGFloat)maxRadius;

@end
