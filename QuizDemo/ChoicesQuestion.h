//
//  ChoicesQuestion.h
//  QuizDemo
//
//  Created by apple on 2017/5/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Model.h"

@interface ChoicesQuestion : Model
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSMutableArray *choices;

@property (nonatomic, strong) NSNumber *valueMin;
@property (nonatomic, strong) NSNumber *valueMax;
@property (nonatomic, strong) NSNumber *questionId;


@end
