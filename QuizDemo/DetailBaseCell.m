//
//  DetailBaseCell.m
//  QuizDemo
//
//  Created by apple on 2017/4/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DetailBaseCell.h"

@implementation DetailBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame{
    frame.size.height -= 5;
    frame.origin.x = 5;
    frame.size.width -= 2 * frame.origin.x;
    [super setFrame:frame];
}


@end
