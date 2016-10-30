//
//  BNSC_KQ1_Question.m
//  BNSCKidQuestions1
//
//  Created by Bill Cochran on 4/1/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import "BNSC_KQ1_Question.h"

@implementation BNSC_KQ1_Question

@synthesize QuestionText;
@synthesize Answers;
@synthesize Adjectives;
@synthesize adjectiveCount;

-(NSString*)getResponseAdjective
{
    return [Adjectives objectAtIndex: arc4random() % (Adjectives.count)];
}

@end
