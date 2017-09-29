//
//  StepSlider.h
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import <UIKit/UIKit.h>

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
 *  Image for slider track dot.
 */
@property (nonatomic, strong) IBInspectable UIImage *sliderTrackImage;

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
 *  Note: If `labels` array not empty set `maxCount` to labels count.
 */
@property (nonatomic, strong) NSArray <NSString *> *labels;

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
 *  Set the `index` property to parameter value.
 *
 *  @param index    The index, that you wanna to be selected.
 *  @param animated `YES` to animate changing of the `index` property.
 */
- (void)setIndex:(NSUInteger)index animated:(BOOL)animated;

@end
