//
//  SliderQuestionCell.h
//  QuizDemo
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailBaseCell.h"
#import "Model.h"
#import "SliderQuestion.h"
#import "Answers.h"

@interface SliderQuestionCell : DetailBaseCell
@property (strong, nonatomic) UISlider *slider;

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

@property (strong, nonatomic) UILabel *minValueLabel;
@property (strong, nonatomic) UILabel *maxValueLabel;

@property (strong, nonatomic) UILabel *numberLabel;

@end
