//
//  TextQuestionCell.m
//  QuizDemo
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TextQuestionCell.h"

@implementation TextQuestionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, [UIScreen mainScreen].bounds.size.width - 30, 40)];
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        [self.contentView addSubview:self.titleLabel];
        
        self.descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 40, [UIScreen mainScreen].bounds.size.width - 30, 40)];
        self.descriptionLabel.font = [UIFont fontWithName:@"Helvetica" size:17];
        self.descriptionLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.descriptionLabel];
        
        self.text = [[UITextField alloc]initWithFrame:CGRectMake(15, 85, [UIScreen mainScreen].bounds.size.width - 40, 30)];
        self.text.returnKeyType = UIReturnKeyDone;
        self.text.borderStyle = UITextBorderStyleRoundedRect;
        self.text.keyboardType = UIKeyboardTypeDefault;
        self.text.clearButtonMode = UITextFieldViewModeAlways;
        self.text.placeholder = @"text";
        self.text.delegate = self;
        [self.contentView addSubview:self.text];
        
        self.placeHolderLabel = [[UILabel alloc]init];
        self.placeHolderLabel.numberOfLines = 0;
        self.placeHolderLabel.textColor = [UIColor lightGrayColor];
        [self.placeHolderLabel sizeToFit];
        [self.text addSubview:self.placeHolderLabel];
        [self.text setValue:self.placeHolderLabel forKey:@"_placeholderLabel"];
    }
    return self;
}


- (void)setBaseModel:(Model *)baseModel{
    TextQuestion *model = (TextQuestion *)baseModel;
    self.titleLabel.text = model.title;
    self.descriptionLabel.text = model.description;

    //提示文字
    self.placeHolderLabel.text = model.textHint;
    
    Answers *answers = [[Answers alloc]init];
    answers.questionId = model.questionId;
    NSString *textAnswer = self.text.text;
    [answers.answer addObject:textAnswer];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_text resignFirstResponder];
    NSLog(@"%@",self.text.text);
    return YES;
}

@end
