//
//  StepSlider.m
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import "StepSlider.h"
#import "TrackView.h"
#import "TrackCircleView.h"
#import "SliderCircleView.h"

#define GENERATE_ACCESS(PROPERTY, LAYER_PROPERTY, TYPE, SETTER, GETTER, UPDATER) \
- (void)SETTER:(TYPE)PROPERTY { \
    if (LAYER_PROPERTY != PROPERTY) { \
        LAYER_PROPERTY = PROPERTY; \
        [self UPDATER]; \
    } \
} \
\
- (TYPE)GETTER { \
    return LAYER_PROPERTY; \
}

@interface StepSlider ()
{
    TrackView *_trackView;
    SliderCircleView *_sliderView;
    NSMutableArray *_trackCirclesArray;
}

@end

@implementation StepSlider

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self generalSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self generalSetup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self generalSetup];
    }
    return self;
}

- (void)generalSetup
{
    _trackCirclesArray = [[NSMutableArray alloc] init];
    _trackView   = [[TrackView alloc] init];
    _sliderView  = [[SliderCircleView alloc] init];
    _trackView.sliderView = _sliderView.sliderView = self;
    [self addSubview:_trackView];
    [self addSubview:_sliderView];
    
    self.maxCount           = 5;
    self.stepIndex          = 3;
    self.trackHeight        = 4.f;
    self.trackCircleRadius  = 5.f;
    self.sliderCircleRadius = 12.5f;
    self.trackColor         = [UIColor colorWithWhite:0.41f alpha:1.f];
    self.sliderCircleColor  = [UIColor whiteColor];
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _trackView.frame = CGRectMake(0.f,
                                   (self.bounds.size.height - self.trackHeight) / 2.f,
                                   self.bounds.size.width,
                                   self.trackHeight);
    [_trackView setNeedsDisplay];
    
    if (_trackCirclesArray.count > self.maxCount) {
        NSArray *circlesToDelete = [_trackCirclesArray subarrayWithRange:NSMakeRange(self.maxCount - 1, _trackCirclesArray.count - self.maxCount)];
        
        for (TrackCircleView *trackCircle in circlesToDelete) {
            [trackCircle removeFromSuperview];
        }
    }
    
    CGFloat stepWidth            = self.bounds.size.width / (self.maxCount - 1);
    CGFloat circleY              = self.bounds.size.height / 2.f - self.trackCircleRadius;
    CGFloat circleFrameSide      = self.trackCircleRadius * 2.f;
    
    for (NSUInteger i = 0; i < self.maxCount; i++) {
        TrackCircleView *trackCircle;
        
        if (i < _trackCirclesArray.count) {
            trackCircle = _trackCirclesArray[i];
        } else {
            trackCircle = [[TrackCircleView alloc] init];
            [_trackCirclesArray addObject:trackCircle];
            trackCircle.sliderView = self;
            [self addSubview:trackCircle];
        }
        
        CGFloat trackCircleX = stepWidth * i - self.trackCircleRadius;
        
        trackCircle.selected = i < self.stepIndex;
        trackCircle.frame = CGRectMake(trackCircleX, circleY, circleFrameSide, circleFrameSide);
        [trackCircle setNeedsDisplay];
    }
    
    CGFloat sliderFrameSide = self.sliderCircleRadius * 2.f;
    _sliderView.frame = CGRectMake(stepWidth * self.stepIndex - self.sliderCircleRadius,
                                    self.bounds.size.height / 2.f - self.sliderCircleRadius,
                                    sliderFrameSide,
                                    sliderFrameSide);
    [self bringSubviewToFront:_sliderView];
    [_sliderView setNeedsDisplay];
}

@end
