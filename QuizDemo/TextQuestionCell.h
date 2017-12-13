//
//  TextQuestionCell.h
//  QuizDemo
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailBaseCell.h"
#import "Model.h"
#import "TextQuestion.h"
#import "Answers.h"

@interface TextQuestionCell : DetailBaseCell<UITextFieldDelegate>
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (strong, nonatomic) UILabel *placeHolderLabel;
@property (strong, nonatomic) UITextField *text;



@end
