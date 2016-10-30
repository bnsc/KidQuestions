//
//  BNSC_KQ1_Question.h
//  BNSCKidQuestions1
//
//  Created by Bill Cochran on 4/1/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNSC_KQ1_Question : NSObject

@property (nonatomic,strong) NSString *QuestionText;
@property (nonatomic,strong) NSArray *Answers;
@property (nonatomic,strong) NSArray *Adjectives;
@property (nonatomic) int adjectiveCount;

-(NSString*)getResponseAdjective;

@end
