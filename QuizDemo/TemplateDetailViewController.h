//
//  TemplateDetailViewController.h
//  QuizDemo
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailBaseCell.h"
#import "SliderQuestionCell.h"
#import "ChoicesQuestionCell.h"
#import "TextQuestionCell.h"
#import "TemplateResult.h"
#import "Detail.h"
#import "DetailResult.h"
#import "Model.h"
#import "SliderQuestion.h"
#import "ChoicesQuestion.h"
#import "TextQuestion.h"
#import "AnswerUpload.h"
#import "Answers.h"

@interface TemplateDetailViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSNumber *Id;
//导航栏名字
@property (nonatomic, copy) NSString *projectName;


@end
