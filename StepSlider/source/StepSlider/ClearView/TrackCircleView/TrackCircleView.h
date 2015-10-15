//
//  TrackCircleView.h
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClearView.h"

@class StepSlider;

@interface TrackCircleView : ClearView

@property (nonatomic, weak) StepSlider *sliderView;
@property (nonatomic) BOOL selected;

@end
