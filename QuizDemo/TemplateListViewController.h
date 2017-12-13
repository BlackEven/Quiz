//
//  TemplateListViewController.h
//  QuizDemo
//
//  Created by apple on 2017/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TemplateList.h"
#import "TemplateResult.h"
#import "TemplateListReviewee.h"
#import "TemplateListCell.h"
#import "TemplateDetailViewController.h"

@interface TemplateListViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
//创建标签数组
@property (nonatomic, strong) NSArray *tags;

@end


