//
//  StepSlider.m
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import "StepSlider.h"

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

static NSString * const kTrackAnimation = @"kTrackAnimation";

@interface StepSlider ()
{
    CAShapeLayer *_trackLayer;
    CAShapeLayer *_sliderCircleLayer;
    NSMutableArray <CAShapeLayer *> *_trackCirclesArray;
}

@end

@implementation StepSlider

#pragma mark - Init

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
    
    _trackLayer = [CAShapeLayer layer];
    _sliderCircleLayer = [CAShapeLayer layer];
    
    [self.layer addSublayer:_sliderCircleLayer];
    [self.layer addSublayer:_trackLayer];
    
    self.maxCount           = 4;
    self.index              = 2;
    self.trackHeight        = 4.f;
    self.trackCircleRadius  = 5.f;
    self.sliderCircleRadius = 12.5f;
    self.trackColor         = [UIColor colorWithWhite:0.41f alpha:1.f];
    self.sliderCircleColor  = [UIColor whiteColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect contentFrame = CGRectMake(self.maxRadius, 0.f, self.bounds.size.width - 2 * self.maxRadius, self.bounds.size.height);
    
    CGFloat stepWidth       = contentFrame.size.width / (self.maxCount - 1);
    CGFloat circleY         = contentFrame.size.height / 2.f - self.trackCircleRadius;
    CGFloat circleFrameSide = self.trackCircleRadius * 2.f;
    CGFloat sliderFrameSide = self.sliderCircleRadius * 2.f;
    
    _sliderCircleLayer.frame     = CGRectMake(0.f, 0.f, sliderFrameSide, sliderFrameSide);
    _sliderCircleLayer.path      = [UIBezierPath bezierPathWithRoundedRect:_sliderCircleLayer.bounds cornerRadius:sliderFrameSide / 2].CGPath;
    _sliderCircleLayer.fillColor = [self.sliderCircleColor CGColor];
    _sliderCircleLayer.position  = CGPointMake(contentFrame.origin.x + stepWidth * self.index , contentFrame.size.height / 2.f);
    
    
    _trackLayer.frame = CGRectMake(contentFrame.origin.x,
                                   (contentFrame.size.height - self.trackHeight) / 2.f,
                                   contentFrame.size.width,
                                   self.trackHeight);
    _trackLayer.path            = [self fillingPath];
    _trackLayer.backgroundColor = [self.trackColor CGColor];
    _trackLayer.fillColor       = [self.tintColor CGColor];

    
    if (_trackCirclesArray.count > self.maxCount) {
        NSArray *circlesToDelete = [_trackCirclesArray subarrayWithRange:NSMakeRange(self.maxCount - 1, _trackCirclesArray.count - self.maxCount)];
        
        for (CAShapeLayer *trackCircle in circlesToDelete) {
            [trackCircle removeFromSuperlayer];
        }
    }
    
    for (NSUInteger i = 0; i < self.maxCount; i++) {
        CAShapeLayer *trackCircle;
        
        CGFloat trackCircleX = stepWidth * i - self.trackCircleRadius;
        CGRect  trackCircleFrame = CGRectMake(contentFrame.origin.x + trackCircleX, circleY, circleFrameSide, circleFrameSide);
        
        if (i < _trackCirclesArray.count) {
            trackCircle       = _trackCirclesArray[i];
            trackCircle.frame = trackCircleFrame;
        } else {
            trackCircle       = [CAShapeLayer layer];
            trackCircle.frame = trackCircleFrame;
            trackCircle.path  = [UIBezierPath bezierPathWithRoundedRect:trackCircle.bounds cornerRadius:circleFrameSide / 2].CGPath;

            [self.layer addSublayer:trackCircle];
            [_trackCirclesArray addObject:trackCircle];
        }
        
        trackCircle.fillColor = [self trackCircleColor:trackCircle];
    }
    
    [_sliderCircleLayer removeFromSuperlayer];
    [self.layer addSublayer:_sliderCircleLayer];
}

#pragma mark - Helpers
/*
 Calculate distance from trackCircle center to point where circle cross track line.
 */
- (CGFloat)diff
{
    return sqrtf(powf(self.trackCircleRadius, 2.f) - pow(self.trackHeight / 2.f, 2.f));
}

- (CGPathRef)fillingPath
{
    CGRect fillRect     = _trackLayer.bounds;
    fillRect.size.width = self.sliderPosition;
    
    return [UIBezierPath bezierPathWithRect:fillRect].CGPath;
}

- (CGFloat)maxRadius
{
    return fmaxf(self.trackCircleRadius, self.sliderCircleRadius);
}

- (CGFloat)sliderPosition
{
    return _sliderCircleLayer.position.x - self.maxRadius;
}

- (CGFloat)trackCirclePosition:(CAShapeLayer *)trackCircle
{
    return trackCircle.position.x - self.maxRadius;
}

- (CGFloat)indexCalculate
{
    return self.sliderPosition / (_trackLayer.bounds.size.width / (self.maxCount - 1));
}

- (CGColorRef)trackCircleColor:(CAShapeLayer *)trackCircle
{
    return self.sliderPosition + [self diff] >= [self trackCirclePosition:trackCircle] ? self.tintColor.CGColor : self.trackColor.CGColor;
}

#pragma mark - Touches

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    return CGRectContainsPoint(_sliderCircleLayer.frame, [touch locationInView:self]);
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGFloat position = [touch locationInView:self].x;
    CGFloat limitedPosition = fminf(fmaxf(position, self.maxRadius), self.bounds.size.width - self.maxRadius);
    
    [CATransaction begin];
    [CATransaction setValue: (id) kCFBooleanTrue forKey: kCATransactionDisableActions];
    
    _sliderCircleLayer.position = CGPointMake(limitedPosition, _sliderCircleLayer.position.y);
    _trackLayer.path = [self fillingPath];
    
    NSUInteger index = (self.sliderPosition + [self diff]) / (_trackLayer.bounds.size.width / (self.maxCount - 1));
    if (_index != index) {
        for (CAShapeLayer *trackCircle in _trackCirclesArray) {
            trackCircle.fillColor = [self trackCircleColor:trackCircle];
        }
        _index = index;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
    [CATransaction commit];
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSUInteger oldIndex = _index;
    _index = roundf([self indexCalculate]);
    
    if (oldIndex != _index) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = [CATransaction animationDuration];
    [_trackLayer addAnimation:basicAnimation forKey:kTrackAnimation];
    
    [self setNeedsLayout];
}

#pragma mark - Access methods

- (void)setIndex:(NSUInteger)index
{
    NSString *error = [NSString stringWithFormat:@"Index %lu beyond bounds [0 .. %lu]", (unsigned long)index, (unsigned long)self.maxCount];
    NSAssert((index < self.maxCount), error);
    
    if (_index != index) {
        _index = index;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
        [self setNeedsLayout];
    }
}

@end
