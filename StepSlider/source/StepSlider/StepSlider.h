//
//  StepSlider.h
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for StepSlider.
FOUNDATION_EXPORT double StepSliderVersionNumber;

//! Project version string for StepSlider.
FOUNDATION_EXPORT const unsigned char StepSliderVersionString[];

/**
 *  Vertical orientatons of dot labels.
 */
typedef NS_ENUM(NSUInteger, StepSliderTextOrientation) {
    /**
     *  Set text labels below slider.
     */
    StepSliderTextOrientationDown,
    /**
     *  Set text labels above slider.
     */
    StepSliderTextOrientationUp,
};

IB_DESIGNABLE

@interface StepSlider : UIControl

/**
 *  Maximum amount of dots in slider. Must be `2` or greater.
 *  Note: If `labels` array not empty set `maxCount` to labels count.
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

/**
 *  Image for slider main wheel.
 */
@property (nonatomic, strong) IBInspectable UIImage *sliderCircleImage;

/**
 *  Text for labels that will be show near every dot.
 *  The text must be an instance of `NSString` or `NSAttributedString`.
 *  Note: If `labels` array are not empty, then `maxCount` will be equal to `labels.count`.
 */
@property (nonatomic, strong) NSArray *labels;

/**
 *  Font of dot labels.
 *  Can not be `IBInspectable`. http://openradar.appspot.com/21889252
 */
@property (nonatomic, strong) UIFont *labelFont;

/**
 *  Color of dot labels.
 */
@property (nonatomic, strong) IBInspectable UIColor *labelColor;

/**
 *  Offset between slider and labels.
 */
@property (nonatomic) IBInspectable CGFloat labelOffset;

/**
 *  Current vertical orientatons of dot labels.
 */
@property (nonatomic) StepSliderTextOrientation labelOrientation;

/**
 *  If `YES` adjust first and last labels to StepSlider frame. And change alingment to left and right. 
 *  Otherwise label position is same as trackCircle, and aligment always is center.
 */
@property (nonatomic) IBInspectable BOOL adjustLabel;

/**
 *  Generate haptic feedback when value was changed. Ignored if low power mode is turned on.
 *  Default value is `false`.
 */
@property (nonatomic) IBInspectable BOOL enableHapticFeedback;


/**
 *  Set the `index` property to parameter value.
 *
 *  @param index    The index, that you wanna to be selected.
 *  @param animated `YES` to animate changing of the `index` property.
 */
- (void)setIndex:(NSUInteger)index animated:(BOOL)animated;


/**
 *  Sets the image to use for track circle for the specified state.
 *  Currently supported only `UIControlStateNormal` and `UIControlStateSelected`.
 *
 *  @param image The image to use for the specified state.
 *  @param state The state that uses the specified image.
 */
- (void)setTrackCircleImage:(UIImage *)image forState:(UIControlState)state;

@end
