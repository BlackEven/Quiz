//
//  TextQuestion.h
//  QuizDemo
//
//  Created by apple on 2017/5/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Model.h"

@interface TextQuestion : Model
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, copy) NSString *textHint;
@property (nonatomic, strong) NSNumber *questionId;
@end
