//
//  Model.m
//  QuizDemo
//
//  Created by apple on 2017/5/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Model.h"
#import "SliderQuestion.h"
#import "ChoicesQuestion.h"
#import "TextQuestion.h"

@implementation Model


//根据字典内提供的数据分别创建出其对应的model来获取数据
+ (instancetype)initWithDictionary:(NSDictionary *)dic {
    
    //先使用当前类(父类)创建出model对象
    Model *model = [[self alloc]init];
    
    //根据字典中key对应的数据初始化不同的子类对象并将其返回给我们的父类
    NSNumber *sliderType = [NSNumber numberWithLong:0];
    NSNumber *choicesType = [NSNumber numberWithLong:1];
    NSNumber *textTypeOne = [NSNumber numberWithLong:2];
    NSNumber *textTypeTwo = [NSNumber numberWithLong:3];
    NSNumber *textTypeThree = [NSNumber numberWithLong:4];
    NSNumber *dicType = [dic valueForKey:@"type"];
    
    if ([dicType isEqualToNumber: sliderType]) {
        model = [[SliderQuestion alloc]init];
        [model setValue:[dic valueForKey:@"title"] forKey:@"title"];
        [model setValue:[dic valueForKey:@"description"] forKey:@"description"];
        [model setValue:[dic valueForKey:@"valueMin"] forKey:@"valueMin"];
        [model setValue:[dic valueForKey:@"valueMax"] forKey:@"valueMax"];
        [model setValue:[dic valueForKey:@"type"] forKey:@"type"];
        [model setValue:[dic valueForKey:@"questionId"] forKey:@"questionId"];
    }else if ([dicType isEqualToNumber: choicesType]) {
        model = [[ChoicesQuestion alloc]init];
        [model setValue:[dic valueForKey:@"title"] forKey:@"title"];
        [model setValue:[dic valueForKey:@"description"] forKey:@"description"];
        [model setValue:[dic valueForKey:@"choices"] forKey:@"choices"];
        [model setValue:[dic valueForKey:@"type"] forKey:@"type"];
        [model setValue:[dic valueForKey:@"questionId"] forKey:@"questionId"];
    }else if ([dicType isEqualToNumber: textTypeOne] || [dicType isEqualToNumber: textTypeTwo]|| [dicType isEqualToNumber: textTypeThree]) {
        model = [[TextQuestion alloc]init];
        [model setValue:[dic valueForKey:@"title"] forKey:@"title"];
        [model setValue:[dic valueForKey:@"description"] forKey:@"description"];
        [model setValue:[dic valueForKey:@"textHint"] forKey:@"textHint"];
        [model setValue:[dic valueForKey:@"type"] forKey:@"type"];
        [model setValue:[dic valueForKey:@"questionId"] forKey:@"questionId"];
    }
    
    
    return model;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

@end
