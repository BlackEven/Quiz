//
//  Answer.h
//  QuizDemo
//
//  Created by apple on 2017/5/8.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Answers : NSObject
@property (nonatomic, strong) NSNumber *questionId;
@property (nonatomic, strong) NSNumber *revieweeId;
@property (nonatomic, copy) NSMutableArray *answer;
@end
