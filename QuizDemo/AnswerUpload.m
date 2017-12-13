//
//  AnswerUpload.m
//  QuizDemo
//
//  Created by apple on 2017/5/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "AnswerUpload.h"
#import "Answers.h"

@implementation AnswerUpload
+ (NSDictionary *)objectClassInArray{
    return @{
             @"answers" : [Answers class]};
}

+ (Class)objectClassInArray:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"answers"]) {
        return [Answers class];
    }
    return nil;}
@end
