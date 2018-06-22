//
//  ViewController.h
//  StepSlider
//
//  Created by Nick on 10/15/15.
//  Copyright © 2015 spromicky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StepSlider/StepSlider.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet StepSlider *sliderView;
@property (nonatomic, strong) IBOutlet UILabel *label;

- (IBAction)changeValue:(StepSlider *)sender;

- (IBAction)changeIndex:(id)sender;
- (IBAction)changeMaxIndex:(id)sender;
- (IBAction)changeTintColor:(id)sender;
- (IBAction)changeSliderCircleColor:(id)sender;
- (IBAction)changeSliderCircleRadius:(id)sender;
- (IBAction)changeTrackColor:(id)sender;
- (IBAction)changeTrackCircleRaidus:(id)sender;
- (IBAction)changeTrackHeight:(id)sender;
- (IBAction)changeTrackCircleImage:(UIButton *)sender;

- (IBAction)toggleLabels:(UIButton *)sender;
- (IBAction)changeLabelsFont:(id)sender;
- (IBAction)changeLabelsColor:(id)sender;
- (IBAction)changeLabelsOffset:(id)sender;
- (IBAction)changeLabelsOrientation:(id)sender;
- (IBAction)adjustLabels:(UIButton *)sender;

@end

