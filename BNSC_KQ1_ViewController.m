//
//  BNSC_KQ1_ViewController.m
//  BNSCKidQuestions1
//
//  Created by William Cochran on 3/23/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import "BNSC_KQ1_ViewController.h"

@interface BNSC_KQ1_ViewController ()

@end

@implementation BNSC_KQ1_ViewController

@synthesize Question;
@synthesize ResponseLabel;

@synthesize Answer1;
@synthesize Answer2;
@synthesize Answer3;
@synthesize Answer4;
@synthesize Answer5;

@synthesize Answer1B;
@synthesize Answer2B;
@synthesize Answer3B;
@synthesize Answer4B;
@synthesize Answer5B;
@synthesize Answer6B;
@synthesize Answer7B;
@synthesize Answer8B;
@synthesize Answer9B;
@synthesize Answer10B;
@synthesize Answer11B;
@synthesize Answer12B;
@synthesize Answer13B;
@synthesize Answer14B;

@synthesize AdImage1;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    brain = [[BNSC_KQ1_Brain alloc]init];
    [brain start];
    [self loadQuestion];
    if([brain hasAdImages]) [AdImage1 setImage:[brain getNextAd]];
}

- (void)viewDidUnload
{
    [self setQuestion:nil];
    [self setAnswer1:nil];
    [self setAnswer2:nil];
    [self setAnswer3:nil];
    [self setAnswer4:nil];
    [self setAnswer5:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void) loadQuestion
{
    
    [self hideAllButtons];
    Question.text = [brain getCurrentQuestionText];
    
    //loop through the answers and set buttons with the answer text.
    NSArray *answerTexts = [brain getAnswerTexts];
    //for 5 or fewer answers:
    if(answerTexts.count <6)
    {
        NSArray *buttons = [NSArray arrayWithObjects: Answer1, Answer2, Answer3, Answer4, Answer5, nil];
        int i;
        for (i = 0; i < [answerTexts count]; i++)
        {
            UIButton *btn = [buttons objectAtIndex:i];
            NSString *answerText = [answerTexts objectAtIndex:i];
            [btn setTitle:answerText forState:UIControlStateNormal];
            btn.hidden = NO;
        }
    }
    //for more than 5 answers:
    else
    {
        NSArray *buttons = [NSArray arrayWithObjects: Answer1B, Answer2B, Answer3B, Answer4B, Answer5B,Answer6B, Answer7B, Answer8B, Answer9B, Answer10B,Answer11B, Answer12B, Answer13B, Answer14B, nil];
        int i;
        for (i = 0; i < [answerTexts count]; i++)
        {
            UIButton *btn = [buttons objectAtIndex:i];
            NSString *answerText = [answerTexts objectAtIndex:i];
            [btn setTitle:answerText forState:UIControlStateNormal];
            btn.hidden = NO;
        }
    }
    //[self.Answer1 setTitle:@"Next" forState:UIControlStateNormal];
    //self.Answer1.hidden = NO;
}

-(void) nextQuestion
{
    [brain nextQuestion];
    [self loadQuestion];
}

- (void) questionAnswered
{
    [brain questionAnswered];
    if([brain isResponseReady])
    {
        
        //display the response text
        self.ResponseLabel.text = [brain getResponseText];
        [self hideAllButtons];
        self.Question.hidden = YES;
        self.ResponseLabel.hidden = NO;
        //change button text to 'start over'
        [self.Answer5 setTitle: @"Start Over >>" forState: UIControlStateNormal];
        self.Answer5.hidden = NO;
    }
    else
    {
        [self nextQuestion];
    }
}

-(void) hideAllButtons
{
    self.ResponseLabel.hidden = YES;
    
    self.Answer1.hidden = YES;
    self.Answer2.hidden = YES;
    self.Answer3.hidden = YES;
    self.Answer4.hidden = YES;
    self.Answer5.hidden = YES;
    
    self.Answer1B.hidden = YES;
    self.Answer2B.hidden = YES;
    self.Answer3B.hidden = YES;
    self.Answer4B.hidden = YES;
    self.Answer5B.hidden = YES;
    self.Answer6B.hidden = YES;
    self.Answer7B.hidden = YES;
    self.Answer8B.hidden = YES;
    self.Answer9B.hidden = YES;
    self.Answer10B.hidden = YES;
    self.Answer11B.hidden = YES;
    self.Answer12B.hidden = YES;
    self.Answer13B.hidden = YES;
    self.Answer14B.hidden = YES;
}

- (IBAction)BtnAnswer1:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer2:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer3:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer4:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer5:(id)sender {
    UIButton *btnSender = sender;
    if([btnSender.currentTitle  isEqual: @"Start Over >>"])
    {
        [brain start];
        [self loadQuestion];
        self.Question.hidden = NO;
        //set up the ads
        if(brain.hasAdImages) [AdImage1 setImage:[brain getNextAd]];
    }
    else 
    {
        [self questionAnswered];
    }
}

- (IBAction)BtnAnswer1B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer2B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer3B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer4B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer5B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer6B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer7B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer8B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer9B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer10B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer11B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer12B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer13B:(id)sender {
    [self questionAnswered];
}

- (IBAction)BtnAnswer14B:(id)sender {
    [self questionAnswered];
}

@end
