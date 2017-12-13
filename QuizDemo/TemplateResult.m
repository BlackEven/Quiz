//
//  TemplateResult.m
//  QuizDemo
//
//  Created by apple on 2017/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TemplateResult.h"
#import "TemplateListReviewee.h"

@implementation TemplateResult
@synthesize description = _description;

+ (NSDictionary *)objectClassInArray{
    return @{
             @"reviewee" : [TemplateListReviewee class] };
}

+ (Class)objectClassInArray:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"reviewee"]) {
        return [TemplateListReviewee class];    }
    return nil;}

@end
