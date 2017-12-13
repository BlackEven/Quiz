//
//  DetailResult.m
//  QuizDemo
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DetailResult.h"
#import "SliderQuestion.h"
#import "ChoicesQuestion.h"
#import "TextQuestion.h"
#import "DetailChoices.h"

@implementation DetailResult
@synthesize description = _description;

+ (NSDictionary *)objectClassInArray{
    return @{
             @"choices" : [DetailChoices class]};
}

+ (Class)objectClassInArray:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"choices"]) {
        return [DetailChoices class];
    }
    return nil;}
@end
