//
//  Model.h
//  QuizDemo
//
//  Created by apple on 2017/5/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@property(nonatomic)BOOL isSelect;
@property(nonatomic)NSInteger tag;
@end
