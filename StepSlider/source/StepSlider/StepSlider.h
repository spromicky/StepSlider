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

/**
 *  Maximum amount of dots in slider.
 */
@property (nonatomic) IBInspectable NSUInteger maxCount;

/**
 *  Currnet selected dot index.
 */
@property (nonatomic) IBInspectable NSUInteger index;


/**
 *  Height of the slider track.
 */
@property (nonatomic) IBInspectable CGFloat trackHeight;

/**
 *  Radius of the default dots on slider track.
 */
@property (nonatomic) IBInspectable CGFloat trackCircleRadius;

/**
 *  Radius of the slider main wheel.
 */
@property (nonatomic) IBInspectable CGFloat sliderCircleRadius;


/**
 *  Color of the slider slider.
 */
@property (nonatomic, strong) IBInspectable UIColor *trackColor;

/**
 *  Color og the slider main wheel.
 */
@property (nonatomic, strong) IBInspectable UIColor *sliderCircleColor;

/**
 *  Set the `index` property to parameter value.
 *
 *  @param index    The index, that you wanna to be selected.
 *  @param animated `YES` to animate changing of the `index` property.
 */
- (void)setIndex:(NSUInteger)index animated:(BOOL)animated;

@end
