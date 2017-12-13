//
//  ChoicesQuestionCell.h
//  QuizDemo
//
//  Created by apple on 2017/4/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoicesQuestion.h"
#import "DetailBaseCell.h"
#import "Model.h"
#import "DLRadioButton.h"
#import "Answers.h"

@interface ChoicesQuestionCell : DetailBaseCell
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;

@property (strong, nonatomic) DLRadioButton *radioButton;
@property (nonatomic, copy) NSMutableArray *choices;


@end
