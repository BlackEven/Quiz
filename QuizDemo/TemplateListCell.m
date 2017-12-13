//
//  TemplateListCell.m
//  QuizDemo
//
//  Created by apple on 2017/4/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TemplateListCell.h"

@implementation TemplateListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//设置cell的frame
- (void)setFrame:(CGRect)frame{
    frame.size.height -= 5;
    frame.origin.x = 5;
    frame.size.width -= 2 * frame.origin.x;
    
    [super setFrame:frame];
}

- (void)setTagModel:(TemplateResult *)tagModel{
    _tagModel = tagModel;
    self.projectNameLabel.text = tagModel.name;
    self.decriptionLabel.text = tagModel.description;
    self.cellId = tagModel.questionnaireId;
}
@end
