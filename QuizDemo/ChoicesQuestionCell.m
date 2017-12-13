//
//  ChoicesQuestionCell.m
//  QuizDemo
//
//  Created by apple on 2017/4/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ChoicesQuestionCell.h"

@implementation ChoicesQuestionCell{
    NSMutableArray *buttonArray;
    NSNumber *maxValue;
    NSNumber *minValue;
    NSString *choice;
    UIButton *btn;
}

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
        
        
    }
    return self;
}

- (void)setBaseModel:(Model *)baseModel{
    ChoicesQuestion *model = (ChoicesQuestion *)baseModel;

    self.titleLabel.text = model.title;
    self.descriptionLabel.text = model.description;
    
    _choices = [model.choices valueForKey:@"text"];
    if(!btn){
        for (int i = 0; i < _choices.count ; ++i){
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:_choices[i] forState:UIControlStateNormal];
        btn.frame = CGRectMake(30, 80+40*i, 700, 35);
        btn.tag = i+100;
        //btn.selected = NO;

        //[btn addTarget:self action:@selector(Choose:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn addTarget:self action:@selector(targetAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn.layer setBorderColor:[UIColor whiteColor].CGColor];
        btn.backgroundColor = [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0];
        [btn.layer setBorderWidth:1.5];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 8;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        
        [buttonArray addObject:btn];
        [self.contentView addSubview:btn];
        }
    }
    
    for (UIButton*bb in buttonArray){
        if(bb.tag == model.tag){
            bb.selected = model.isSelect;
            break;
        }
    }
    Answers *answers = [[Answers alloc]init];
    answers.questionId = model.questionId;
    [answers.answer addObject:choice];
}

/*
- (void)Choose:(UIButton *)sender{
    for (int i = 0; i < _choices.count; i++){
        UIButton *btn = (UIButton *)[[sender superview]viewWithTag:100 + i];
        if(sender.tag == btn.tag){
            sender.selected =! sender.selected;
        }else{
            [btn setSelected:NO];
        }
    }
    choice = sender.titleLabel.text;
    NSLog(@"%@",choice);
}
*/

- (void)targetAction:(UIButton *)sender{
    btn.selected = NO;
    sender.selected = YES;
    btn = sender;
    self.clickButtonAction(sender.tag);
}

@end
