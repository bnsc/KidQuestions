//
//  BNSC_KQ1_Brain.h
//  BNSCKidQuestions1
//
//  Created by Admin on 5/28/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNSC_KQ1_ClassFactory.h"

@interface BNSC_KQ1_Brain : NSObject
{
    int currentQuestion;
    NSArray *QuestionBank;
    NSArray *QuestionsToUse;
    NSString *Response;
    BOOL bool_isResponseReady;
    
    NSArray *AdImages;
    int currentAdImage;
}

-(void) start;
-(void) nextQuestion;
-(NSString*) getCurrentQuestionText;
-(void)questionAnswered;
-(BOOL)isResponseReady;
-(NSString*) getResponseText;
-(NSArray*) getAnswerTexts;
-(Boolean) hasAdImages;
-(UIImage*) getNextAd;

@end
