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

@property (nonatomic) IBInspectable NSUInteger maxCount;
@property (nonatomic) IBInspectable NSUInteger index;

@property (nonatomic) IBInspectable CGFloat trackHeight;
@property (nonatomic) IBInspectable CGFloat trackCircleRadius;
@property (nonatomic) IBInspectable CGFloat sliderCircleRadius;

@property (nonatomic, strong) IBInspectable UIColor *trackColor;
@property (nonatomic, strong) IBInspectable UIColor *sliderCircleColor;

@end
