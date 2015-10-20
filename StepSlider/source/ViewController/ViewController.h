//
//  ViewController.h
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepSlider.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet StepSlider *sliderView;
@property (nonatomic, strong) IBOutlet UILabel *label;

- (IBAction)changeValue:(StepSlider *)sender;

@end

