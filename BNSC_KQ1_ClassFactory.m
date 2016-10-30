//
//  BNSC_KQ1_ClassFactory.m
//  BNSCKidQuestions1
//
//  Created by Bill Cochran on 4/1/14.
//  Copyright (c) 2014 BNSC, Inc. All rights reserved.
//

#import "BNSC_KQ1_ClassFactory.h"

@implementation BNSC_KQ1_ClassFactory

+(NSArray*)getAdImages
{
    UIImage *image1 = [UIImage imageNamed:@"Art1.png"];
    UIImage *image2 = [UIImage imageNamed:@"Art2.png"];
    UIImage *image3 = [UIImage imageNamed:@"Art3.png"];

    UIImage *image5 = [UIImage imageNamed:@"Art5.png"];
    UIImage *image6 = [UIImage imageNamed:@"Art6.png"];
    UIImage *image7 = [UIImage imageNamed:@"Art7.png"];
    UIImage *image8 = [UIImage imageNamed:@"Art8.png"];
    UIImage *image9 = [UIImage imageNamed:@"Art9.png"];
    UIImage *image10 = [UIImage imageNamed:@"Art10.png"];
    UIImage *image11 = [UIImage imageNamed:@"Art11.png"];
    UIImage *image12 = [UIImage imageNamed:@"Art12.png"];
    UIImage *image13 = [UIImage imageNamed:@"Art13.png"];
    UIImage *image14 = [UIImage imageNamed:@"Art14.png"];
    UIImage *image15 = [UIImage imageNamed:@"Art15.png"];
    UIImage *image16 = [UIImage imageNamed:@"Art16.png"];

    UIImage *image20 = [UIImage imageNamed:@"Art20.png"];
    UIImage *image21 = [UIImage imageNamed:@"Art21.png"];
    UIImage *image22 = [UIImage imageNamed:@"Art22.png"];
    UIImage *image23 = [UIImage imageNamed:@"Art23.png"];
    UIImage *image24 = [UIImage imageNamed:@"Art24.png"];
    
    NSArray *_adImages = [NSArray arrayWithObjects: image1,image2,image3,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image20,image21,image22,image23,image24,nil];
    return _adImages;
}

+(NSArray*)getAdImagesFromWeb
{
    // Send a synchronous request
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://bnsc-apps.azurewebsites.net/v1/ads"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    //there is an error getting ad images.  return empty ad images...or maybe hard coded add images.
    if (error != nil)
    {
        // Parse data here
        NSArray * adImages = [[NSArray alloc]init];
        return adImages;
    }
    else
    {
        NSError *error2 = nil;
        id object = [NSJSONSerialization
                     JSONObjectWithData:data
                     options:0
                     error:&error2];
        if(error2) {
            //error condition
        }
        
        NSMutableArray *ads = [[NSMutableArray alloc] init];
        
        if([object isKindOfClass:[NSArray class]] && error2 == nil)
        {
            //NSLog(@"Found Array");
            
            NSArray * rawAds = object;
            for(id item in rawAds)
            {
                //get the image object from the array
                NSString *encodedImage = [item objectForKey:@"image" ];
                NSData *b64Image = [[NSData alloc] initWithBase64Encoding: encodedImage];
                UIImage *adImage = [UIImage imageWithData:b64Image];
                [ads addObject:adImage];
            }
        }
        return ads;
    }
    
}

+(NSArray*)getQuestions
{
    //initialize objects
    BNSC_KQ1_Question *q0 = [[BNSC_KQ1_Question alloc] init];
    BNSC_KQ1_Question *q1 = [[BNSC_KQ1_Question alloc] init];
    BNSC_KQ1_Question *q2 = [[BNSC_KQ1_Question alloc] init];
    BNSC_KQ1_Question *q3 = [[BNSC_KQ1_Question alloc] init];
    BNSC_KQ1_Question *q4 = [[BNSC_KQ1_Question alloc] init];
    BNSC_KQ1_Question *q5 = [[BNSC_KQ1_Question alloc] init];
    BNSC_KQ1_Question *q6 = [[BNSC_KQ1_Question alloc] init];
    BNSC_KQ1_Question *q7 = [[BNSC_KQ1_Question alloc] init];
    
    //set the questions
    q0.QuestionText = @"Are you a BOY or GIRL?";
    q1.QuestionText = @"What is your favorite COLOR?";
    q2.QuestionText = @"How many SIBLINGS do you have?";
    q3.QuestionText = @"What COLOR is your hair?";
    q4.QuestionText = @"What is your favorite ANIMAL?";
    q5.QuestionText = @"Are you SMART or SILLY?";
    q6.QuestionText = @"Are you BIG or SMALL?";
    q7.QuestionText = @"What is your favorite SHAPE?";
    
    //set the answers
    q0.Answers = [NSArray arrayWithObjects: @"Boy",@"Girl",nil];
    q1.Answers = [NSArray arrayWithObjects: @"Red",@"Yellow",
                                            @"Orange",@"Black",
                                            @"Blue",@"Green",
                                            @"Indigo",@"Gold",
                                            @"Silver",@"Purple",
                                            @"Light Green",@"Pink",
                                            @"Turquoise",@"Something Else",nil];
    q2.Answers = [NSArray arrayWithObjects: @"Only Child",@"1",@"2",@"3",@"4+",nil];
    q3.Answers = [NSArray arrayWithObjects: @"Brown",@"Black",
                                            @"Blonde",@"Red",@"Something Else",nil];
    q4.Answers = [NSArray arrayWithObjects: @"Bunny Rabbit",@"Cat",
                                            @"Dog",@"Horse",@"Something Else", nil];
    q5.Answers = [NSArray arrayWithObjects: @"Smart",@"Silly", nil];
    q6.Answers = [NSArray arrayWithObjects: @"Big",@"Small", nil];
    q7.Answers = [NSArray arrayWithObjects: @"Star",@"Diamond",
                                            @"Circle",@"Square",@"Something Else", nil];
    //set the adjectives
    q0.Adjectives = [NSArray arrayWithObjects: @"messy",@"loud",@"stinky",
                                               @"pretty",@"kind",@"smart", nil];
    q1.Adjectives = [NSArray arrayWithObjects: @"durable",@"suspicious",
                                               @"friendly",@"adventurous",
                                               @"useful",@"refreshing",
                                               @"quiet",@"happy",
                                               @"easy going",@"interesting",
                                               @"entertaining",@"sweet",
                                               @"creepy",@"hot tempered",
                                               @"busy",@"solid",
                                               @"cranky",@"wimpy",
                                               @"bossy",@"flexible",
                                               @"respectful",@"wonderful",
                                               @"crabby",@"talkative",
                                               @"humble",@"strong",
                                               @"crusty",@"roaring", nil];
    q2.Adjectives = [NSArray arrayWithObjects:@"destructive",@"average",@"independent",
                                              @"terrible",@"incredible",@"wise",
                                              @"clumsy",@"smelly",@"fun",
                                              @"wistful",@"jumpy",@"popular",
                                              @"bright eyed",@"new",@"simple", nil];
    q3.Adjectives = [NSArray arrayWithObjects:@"noisy",@"organized",@"pushy",
                                              @"crazy",@"smiley",@"justified",
                                              @"photogenic",@"awesome",@"loving",
                                              @"open",@"moldy",@"quick",
                                              @"boring",@"pesky",@"quacky", nil];
    q4.Adjectives = [NSArray arrayWithObjects:@"simple",@"lovely",
                                              @"nervous",@"young",
                                              @"bashful",@"smooth",
                                              @"hairy",@"athletic",
                                              @"trustworthy",@"sad", nil];
    q5.Adjectives = [NSArray arrayWithObjects:@"curious",@"horrible",@"funny",
                                              @"outrageous",@"lonley",@"mean", nil];
    q6.Adjectives = [NSArray arrayWithObjects:@"amazing",@"intelligent",@"determined",
                                              @"horsey",@"generous",@"fancy", nil];
    q7.Adjectives = [NSArray arrayWithObjects:@"rumpled",@"wishful",
                                              @"fluffy",@"mature",
                                              @"speedy",@"tasteful",
                                              @"lame",@"adorable",
                                              @"fabulous",@"romantic", nil];
    //set the adjective count for each asnwer
    //  (use this to determine which adjectives go with which answer.)
    q0.adjectiveCount = 3;
    q1.adjectiveCount = 2;
    q2.adjectiveCount = 3;
    q3.adjectiveCount = 3;
    q4.adjectiveCount = 2;
    q5.adjectiveCount = 3;
    q6.adjectiveCount = 3;
    q7.adjectiveCount = 2;
        //we only want to return three questions, so here we will decide which questions to return
    
    return [NSArray arrayWithObjects:q0,q1,q2,q3,q4,q5,q6,q7, nil];
}



@end
