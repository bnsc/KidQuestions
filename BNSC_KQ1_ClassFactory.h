//
//  BNSC_KQ1_ClassFactory.h
//  BNSCKidQuestions1
//
//  Created by Bill Cochran on 4/1/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNSC_KQ1_Question.h"

@interface BNSC_KQ1_ClassFactory : NSObject

+(NSArray*)getQuestions;
+(NSArray*)getAdImages;
+(NSArray*)getAdImagesFromWeb;

@end
