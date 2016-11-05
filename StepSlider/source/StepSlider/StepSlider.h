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
 *  Maximum amount of dots in slider. Must be `2` or greater.
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
 *  A Boolean value that determines whether user interaction with dots are ignored. Default value is `YES`.
 */
@property (nonatomic, getter=isDotsInteractionEnabled) IBInspectable BOOL dotsInteractionEnabled;


/**
 *  Color of the slider slider.
 */
@property (nonatomic, strong) IBInspectable UIColor *trackColor;

/**
 *  Color of the slider main wheel.
 */
@property (nonatomic, strong) IBInspectable UIColor *sliderCircleColor;


@property (nonatomic, strong) IBInspectable UIImage *sliderCircleImage;

/**
 *  Set the `index` property to parameter value.
 *
 *  @param index    The index, that you wanna to be selected.
 *  @param animated `YES` to animate changing of the `index` property.
 */
- (void)setIndex:(NSUInteger)index animated:(BOOL)animated;

@end
