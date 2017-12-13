//
//  TemplateResult.h
//  QuizDemo
//
//  Created by apple on 2017/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TemplateResult : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSDate * createdOn;
@property (nonatomic, copy) NSString *project;
@property (nonatomic, copy) NSMutableArray *reviewee;
@property (nonatomic, strong) NSNumber *questionnaireId;
@property (nonatomic) BOOL done;


@end
