//
//  Detail.m
//  QuizDemo
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Detail.h"
#import "SliderQuestion.h"
#import "ChoicesQuestion.h"
#import "TextQuestion.h"
#import "DetailResult.h"

@implementation Detail

+ (NSDictionary *)objectClassInArray{
    return @{
             @"result" : [DetailResult class]};
}

+ (Class)objectClassInArray:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"result"]) {
        return [DetailResult class];
    }
    return nil;
}


@end
