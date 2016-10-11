//
//  ViewController.m
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sliderView.circleTitles = @[@"111",@"2222",@"333",@"4444",@"5",@"6",@"7"];
    [self.label setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.sliderView.index]];
}

- (IBAction)changeValue:(StepSlider *)sender
{
    [self.label setText:[NSString stringWithFormat:@"%lu", (unsigned long)sender.index]];
}

- (IBAction)changeIndex:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            [self.sliderView setIndex:self.sliderView.maxCount - 1 animated:YES];
            break;
            
        case 1:
            [self.sliderView setIndex:self.sliderView.maxCount / 2 animated:YES];
            break;
            
        case 2:
            [self.sliderView setIndex:self.sliderView.maxCount / 3 animated:YES];
            break;
            
        case 3:
            [self.sliderView setIndex:0 animated:YES];
            break;
            
        case 4:
            [self.sliderView setIndex:1 animated:YES];
            break;
    }
    flag++;
}

- (IBAction)changeMaxIndex:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            self.sliderView.maxCount = 19;
            break;
            
        case 1:
            self.sliderView.maxCount = 2;
            break;
            
        case 2:
            self.sliderView.maxCount = 5;
            break;
            
        case 3:
            self.sliderView.maxCount = 8;
            break;
            
        case 4:
            self.sliderView.maxCount = 4;
            break;
    }
    flag++;
}

- (IBAction)changeTintColor:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            self.sliderView.tintColor = [UIColor redColor];
            break;
            
        case 1:
            self.sliderView.tintColor = [UIColor blueColor];
            break;
            
        case 2:
            self.sliderView.tintColor = [UIColor grayColor];
            break;
            
        case 3:
            self.sliderView.tintColor = [UIColor yellowColor];
            break;
            
        case 4:
            self.sliderView.tintColor = [UIColor magentaColor];
            break;
    }
    flag++;
}

- (IBAction)changeSliderCircleColor:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            self.sliderView.sliderCircleColor = [UIColor redColor];
            break;
            
        case 1:
            self.sliderView.sliderCircleColor = [UIColor blueColor];
            break;
            
        case 2:
            self.sliderView.sliderCircleColor = [UIColor grayColor];
            break;
            
        case 3:
            self.sliderView.sliderCircleColor = [UIColor yellowColor];
            break;
            
        case 4:
            self.sliderView.sliderCircleColor = [UIColor magentaColor];
            break;
    }
    flag++;
}

- (IBAction)changeTrackColor:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            self.sliderView.trackColor = [UIColor redColor];
            break;
            
        case 1:
            self.sliderView.trackColor = [UIColor blueColor];
            break;
            
        case 2:
            self.sliderView.trackColor = [UIColor grayColor];
            break;
            
        case 3:
            self.sliderView.trackColor = [UIColor yellowColor];
            break;
            
        case 4:
            self.sliderView.trackColor = [UIColor magentaColor];
            break;
    }
    flag++;
}

- (IBAction)changeSliderCircleRadius:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            self.sliderView.sliderCircleRadius = 0.f;
            break;
            
        case 1:
            self.sliderView.sliderCircleRadius = self.sliderView.trackHeight;
            break;
            
        case 2:
            self.sliderView.sliderCircleRadius = self.sliderView.trackHeight * 2.f;
            break;
            
        case 3:
            self.sliderView.sliderCircleRadius = self.sliderView.trackCircleRadius;
            break;
            
        case 4:
            self.sliderView.sliderCircleRadius = self.sliderView.trackCircleRadius * 2.f;
            break;
    }
    flag++;
}

- (IBAction)changeTrackCircleRaidus:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            self.sliderView.trackCircleRadius = 0.f;
            break;
            
        case 1:
            self.sliderView.trackCircleRadius = self.sliderView.trackHeight;
            break;
            
        case 2:
            self.sliderView.trackCircleRadius = self.sliderView.trackHeight * 2.f;
            break;
            
        case 3:
            self.sliderView.trackCircleRadius = self.sliderView.sliderCircleRadius;
            break;
            
        case 4:
            self.sliderView.trackCircleRadius = self.sliderView.sliderCircleRadius * 2.f;
            break;
    }
    flag++;
}

- (IBAction)changeTrackHeight:(id)sender
{
    static NSUInteger flag = 0;
    switch (flag % 5) {
        case 0:
            self.sliderView.trackHeight = 0.f;
            break;
            
        case 1:
            self.sliderView.trackHeight = 2.f;
            break;
            
        case 2:
            self.sliderView.trackHeight = 10.f;
            break;
            
        case 3:
            self.sliderView.trackHeight = self.sliderView.bounds.size.height;
            break;
            
        case 4:
            self.sliderView.trackHeight = self.sliderView.bounds.size.height * 2.f;
            break;
    }
    flag++;
}

@end
