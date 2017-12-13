//
//  SliderQusetionCell.m
//  QuizDemo
//
//  Created by apple on 2017/4/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "SliderQuestionCell.h"


@implementation SliderQuestionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
        
        self.minValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 140, 15, 40)];
        self.minValueLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
        [self.contentView addSubview:self.minValueLabel];
        
        self.maxValueLabel = [[UILabel alloc]initWithFrame:CGRectMake(720, 140, 15, 40)];
        self.maxValueLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
        [self.contentView addSubview:self.maxValueLabel];
        
        self.numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(375, 170, 15, 40)];
        self.numberLabel.textColor = [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0];
        self.numberLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
        [self.contentView addSubview:self.numberLabel];

        
        self.slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 140, [UIScreen mainScreen].bounds.size.width - 120, 40)];
        self.slider.tintColor = [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0];
        [self.slider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.slider];
        
    }
    return self;
}

- (void)valueChange:(UISlider *)sender{
    self.numberLabel.text = [NSString stringWithFormat:@"%d",(int)sender.value];
}

- (void)setBaseModel:(Model *)baseModel{
    SliderQuestion *model = (SliderQuestion *)baseModel;

    self.titleLabel.text = model.title;
    self.descriptionLabel.text = model.description;


    self.minValueLabel.text = [NSString stringWithFormat:@"%@",model.valueMin];
    self.maxValueLabel.text = [NSString stringWithFormat:@"%@",model.valueMax];
    
    Answers *answers = [[Answers alloc]init];
    answers.questionId = model.questionId;
    NSString *sliderValue = [NSString stringWithFormat:@"%d",(int)_slider.value];
    [answers.answer addObject:sliderValue];
    
    //设置slider
    float maxValue = [model.valueMax floatValue];
    float minValue = [model.valueMin floatValue];
    self.slider.maximumValue = maxValue;
    self.slider.minimumValue = minValue;
    
}


@end
