//
//  BNSC_KQ1_Brain.m
//  BNSCKidQuestions1
//
//  Created by Admin on 5/28/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import "BNSC_KQ1_Brain.h"

@implementation BNSC_KQ1_Brain



-(BNSC_KQ1_Brain*)init
{
    currentAdImage = 0;
    self = [super init];
    QuestionBank = [BNSC_KQ1_ClassFactory getQuestions];
    AdImages = [ BNSC_KQ1_ClassFactory getAdImages];
    //if(AdImages.count > 0)
    //{
    //    NSLog(@"Found ad images");
    //}
    return self;
}

-(void)start
{
    bool_isResponseReady = NO;
    currentQuestion = 0;
    QuestionsToUse = [self setRandomValues];
    Response = @"You are a";
//    [self loadQuestion: [(NSNumber *)[QuestionsToUse objectAtIndex:currentQuestion] intValue]];
}



-(void)nextQuestion
{
    currentQuestion++;
}
-(BNSC_KQ1_Question *) getCurrentQuestion
{
    int questionBankID = [(NSNumber*)[QuestionsToUse objectAtIndex:currentQuestion] intValue];
    BNSC_KQ1_Question *q = [QuestionBank objectAtIndex:questionBankID];
    return q;
}

-(NSString*)getCurrentQuestionText
{
    BNSC_KQ1_Question *q =[self getCurrentQuestion];
    return [q QuestionText];
}

-(void)questionAnswered
{
    //add to the response text
    BNSC_KQ1_Question *q = [self getCurrentQuestion];
    NSString * adjective = [q getResponseAdjective];
    Response = [Response stringByAppendingString: @" "];
    Response = [Response stringByAppendingString: adjective];
    if(currentQuestion==0 || currentQuestion == 1) Response = [Response stringByAppendingString: @","];
    if(currentQuestion==2)Response = [Response stringByAppendingString: @" person."];
    //if the current question is 2, then three responses have been given...
    if(currentQuestion>=2) bool_isResponseReady = YES;
}

-(BOOL)isResponseReady
{
    return bool_isResponseReady;
}

-(NSString*) getResponseText
{
    return Response;
}

-(NSArray*)setRandomValues
{
    int question1, question2, question3;
    question1 = [self getRandomNumber: [NSArray arrayWithObjects: nil]];
    question2 = [self getRandomNumber: [NSArray arrayWithObjects: [NSNumber numberWithInt:question1], nil]];
    question3 = [self getRandomNumber: [NSArray arrayWithObjects: [NSNumber numberWithInt:question1], [NSNumber numberWithInt:question2], nil]];
    
    return [NSArray arrayWithObjects: [NSNumber numberWithInt:question1],[NSNumber numberWithInt:question2],[NSNumber numberWithInt:question3], nil];
}

-(int)getRandomNumber:(NSArray*)OtherRandomValues
{
    //get random number between 0 and 7
    int rndValue = arc4random() % 8;
    int i;
    for (i = 0; i < [OtherRandomValues count]; i++)
    {
        NSNumber *num = [OtherRandomValues objectAtIndex:i];
        if( [num intValue] == rndValue ) rndValue = [self getRandomNumber:OtherRandomValues];
    }
    
    return rndValue;
}

-(NSArray*) getAnswerTexts
{
    BNSC_KQ1_Question *q = [self getCurrentQuestion];
    return q.Answers;
}

-(Boolean) hasAdImages
{
    if(AdImages.count > 0 ) return true;
    else return false;
}

-(UIImage*) getNextAd
{
    UIImage * nextImage = [AdImages objectAtIndex:currentAdImage];
    if(currentAdImage == AdImages.count-1) currentAdImage = 0;
    else currentAdImage++;
    return nextImage;
}

@end
