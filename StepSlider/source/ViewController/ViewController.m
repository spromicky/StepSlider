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

    [self.label setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.sliderView.index]];
}

- (IBAction)changeValue:(StepSlider *)sender
{
    [self.label setText:[NSString stringWithFormat:@"%lu", (unsigned long)sender.index]];
}

@end
