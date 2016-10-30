//
//  BNSC_KQ1_ViewController.h
//  BNSCKidQuestions1
//
//  Created by William Cochran on 3/23/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BNSC_KQ1_Brain.h"

@interface BNSC_KQ1_ViewController : UIViewController
{
    BNSC_KQ1_Brain *brain;
}

@property (strong, nonatomic) IBOutlet UILabel *Question;
@property (strong, nonatomic) IBOutlet UILabel *ResponseLabel;

@property (strong, nonatomic) IBOutlet UIButton *Answer1;
@property (strong, nonatomic) IBOutlet UIButton *Answer2;
@property (strong, nonatomic) IBOutlet UIButton *Answer3;
@property (strong, nonatomic) IBOutlet UIButton *Answer4;
@property (strong, nonatomic) IBOutlet UIButton *Answer5;

- (IBAction)BtnAnswer1:(id)sender;
- (IBAction)BtnAnswer2:(id)sender;
- (IBAction)BtnAnswer3:(id)sender;
- (IBAction)BtnAnswer4:(id)sender;
- (IBAction)BtnAnswer5:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *Answer1B;
@property (strong, nonatomic) IBOutlet UIButton *Answer2B;
@property (strong, nonatomic) IBOutlet UIButton *Answer3B;
@property (strong, nonatomic) IBOutlet UIButton *Answer4B;
@property (strong, nonatomic) IBOutlet UIButton *Answer5B;
@property (strong, nonatomic) IBOutlet UIButton *Answer6B;
@property (strong, nonatomic) IBOutlet UIButton *Answer7B;
@property (strong, nonatomic) IBOutlet UIButton *Answer8B;
@property (strong, nonatomic) IBOutlet UIButton *Answer9B;
@property (strong, nonatomic) IBOutlet UIButton *Answer10B;
@property (strong, nonatomic) IBOutlet UIButton *Answer11B;
@property (strong, nonatomic) IBOutlet UIButton *Answer12B;
@property (strong, nonatomic) IBOutlet UIButton *Answer13B;
@property (strong, nonatomic) IBOutlet UIButton *Answer14B;

- (IBAction)BtnAnswer1B:(id)sender;
- (IBAction)BtnAnswer2B:(id)sender;
- (IBAction)BtnAnswer3B:(id)sender;
- (IBAction)BtnAnswer4B:(id)sender;
- (IBAction)BtnAnswer5B:(id)sender;
- (IBAction)BtnAnswer6B:(id)sender;
- (IBAction)BtnAnswer7B:(id)sender;
- (IBAction)BtnAnswer8B:(id)sender;
- (IBAction)BtnAnswer9B:(id)sender;
- (IBAction)BtnAnswer10B:(id)sender;
- (IBAction)BtnAnswer11B:(id)sender;
- (IBAction)BtnAnswer12B:(id)sender;
- (IBAction)BtnAnswer13B:(id)sender;
- (IBAction)BtnAnswer14B:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *AdImage1;

@end
