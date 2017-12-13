//
//  TemplateListCell.h
//  QuizDemo
//
//  Created by apple on 2017/4/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateResult.h"

@class TemplateResult;

@interface TemplateListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *projectNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *decriptionLabel;
@property (nonatomic, strong) NSNumber *cellId;

//设置标签模型
@property (nonatomic,strong) TemplateResult *tagModel;
@end
