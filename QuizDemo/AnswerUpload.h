//
//  AnswerUpload.h
//  QuizDemo
//
//  Created by apple on 2017/5/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnswerUpload : NSObject
@property (nonatomic, strong) NSNumber *questionnaireId;
@property (nonatomic, strong) NSNumber *answerId;
@property (nonatomic, copy) NSMutableArray *answers;
@end
