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
    
    self.maxCount           = 4;
    self.index              = 2;
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
    
    CGRect contentFrame = CGRectMake([self maxRadius], 0.f, self.bounds.size.width - 2 * [self maxRadius], self.bounds.size.height);
    
    CGFloat stepWidth            = contentFrame.size.width / (self.maxCount - 1);
    CGFloat circleY              = contentFrame.size.height / 2.f - self.trackCircleRadius;
    CGFloat circleFrameSide      = self.trackCircleRadius * 2.f;
    
    CGFloat sliderFrameSide = self.sliderCircleRadius * 2.f;
    _sliderView.frame = CGRectMake(contentFrame.origin.x + stepWidth * self.index - self.sliderCircleRadius,
                                   contentFrame.size.height / 2.f - self.sliderCircleRadius,
                                   sliderFrameSide,
                                   sliderFrameSide);
    [_sliderView setNeedsDisplay];
    
    _trackView.frame = CGRectMake(contentFrame.origin.x,
                                  (contentFrame.size.height - self.trackHeight) / 2.f,
                                  contentFrame.size.width,
                                  self.trackHeight);
    [_trackView setNeedsDisplay];
    
    if (_trackCirclesArray.count > self.maxCount) {
        NSArray *circlesToDelete = [_trackCirclesArray subarrayWithRange:NSMakeRange(self.maxCount - 1, _trackCirclesArray.count - self.maxCount)];
        
        for (TrackCircleView *trackCircle in circlesToDelete) {
            [trackCircle removeFromSuperview];
        }
    }
    
    for (NSUInteger i = 0; i < self.maxCount; i++) {
        TrackCircleView *trackCircle;
        
        if (i < _trackCirclesArray.count) {
            trackCircle = _trackCirclesArray[i];
        } else {
            trackCircle = [[TrackCircleView alloc] init];
            trackCircle.sliderView = self;
            
            [self addSubview:trackCircle];
            [_trackCirclesArray addObject:trackCircle];
        }
        
        CGFloat trackCircleX = stepWidth * i - self.trackCircleRadius;
        
        trackCircle.frame = CGRectMake(contentFrame.origin.x + trackCircleX, circleY, circleFrameSide, circleFrameSide);
        [trackCircle setNeedsDisplay];
    }
    
    [self bringSubviewToFront:_sliderView];
}

- (CGFloat)maxRadius
{
    return fmaxf(self.trackCircleRadius, self.sliderCircleRadius);
}

- (CGFloat)sliderPosition
{
    return _sliderView.center.x - [self maxRadius];
}

- (CGFloat)indexCalculate
{
    return [self sliderPosition] / (_trackView.bounds.size.width / (self.maxCount - 1));
}

#pragma mark - Touches

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    return CGRectContainsPoint(_sliderView.frame, [touch locationInView:self]);
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGFloat maxRadius = fmaxf(self.trackCircleRadius, self.sliderCircleRadius);
    CGFloat position = [touch locationInView:self].x;
    CGFloat limitedPosition = fminf(fmaxf(position, maxRadius), self.bounds.size.width - maxRadius);
    
    _sliderView.center = CGPointMake(limitedPosition, _sliderView.center.y);
    [_trackView setNeedsDisplay];
    
    NSUInteger index = [self indexCalculate];
    if (_index != index) {
        for (TrackCircleView *trackCircle in _trackCirclesArray) {
            [trackCircle setNeedsDisplay];
        }
        _index = index;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.index = roundf([self indexCalculate]);
    [UIView animateWithDuration:0.3f animations:^{
        [self setNeedsLayout];
    }];
}

#pragma mark - Access methods

- (void)setIndex:(NSUInteger)index
{
    if (_index != index) {
        _index = index;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
