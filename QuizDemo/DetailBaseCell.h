//
//  DetailBaseCell.h
//  QuizDemo
//
//  Created by apple on 2017/4/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model;

@interface DetailBaseCell : UITableViewCell

// 在父类中申明出一个BaseModel对象，在其子类里重写set方法，在set方法内部去做赋值操作
@property (nonatomic, strong)  Model *baseModel;

@property(nonatomic,strong)void(^clickButtonAction)(NSInteger tag);
@end
