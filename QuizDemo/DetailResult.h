//
//  DetailResult.h
//  QuizDemo
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailResult : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *textHint;
@property (nonatomic, strong) NSNumber *questionId;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *valueMin;
@property (nonatomic, strong) NSNumber *valueMax;
@property (nonatomic, strong) NSNumber *questionNext;
@property (nonatomic, copy) NSMutableArray *choices;

@end
