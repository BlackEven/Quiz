//
//  TemplateList.m
//  QuizDemo
//
//  Created by apple on 2017/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TemplateList.h"
#import "TemplateResult.h"

@implementation TemplateList
//说明数组中存储的模型数据类型
+ (NSDictionary *)objectClassInArray{
    return @{
             @"result" : [TemplateResult class]};
}

+ (Class)objectClassInArray:(NSString *)propertyName{
    if ([propertyName isEqualToString:@"result"]) {
        return [TemplateResult class];
    }
    return nil;}
@end
