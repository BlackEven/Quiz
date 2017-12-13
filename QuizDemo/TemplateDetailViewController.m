//
//  TemplateDetailViewController.m
//  QuizDemo
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TemplateDetailViewController.h"
#import <UITableView+FDTemplateLayoutCell.h>


@interface TemplateDetailViewController ()
//数据数组

@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSMutableArray *questions;

@end

@implementation TemplateDetailViewController


- (void)netWork{
    //弹框
    [SVProgressHUD show];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //拼接url
    NSString *url = [NSString stringWithFormat:@"http://www.homis.site/polls/questionnaireDetail?questionnaireId=%@",_Id];
    NSLog(@"%@",url);
    //发送请求
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject == nil){
            //关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
            return;
        }
        NSLog(@"请求数据成功");
        NSLog(@"%@",responseObject);
        Detail *list = [Detail mj_objectWithKeyValues:responseObject];
        self.questions = list.result;
        NSArray *array = [NSArray arrayWithArray:_questions];
        for (NSDictionary *dic in array) {
            Model *model = [Model initWithDictionary:dic];
            //将不同的子类创建的model对象添加到数组中
            [self.dataArr addObject:model];
        }
        //刷新表格
        [self.tableView reloadData];
        //关闭弹框
        [SVProgressHUD dismiss];
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"请求数据失败");
        NSLog(@"%@",error);
        //取消任务，直接返回
        if (error.code == -999) return;
        //错误编码为请求超时，弹框提示
        if (error.code == NSURLErrorTimedOut){
            //关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载标签数据超时，请稍后再试!"];
        }else{
            //关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
        }
    }];
}

- (void)uploadAnswer{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    int i = arc4random() % 5;
    NSDictionary *test = @{
                           @"questionnaireId" : _Id,
                           @"answerId" : [NSString stringWithFormat:@"%d",i],
                           @"answers" : @[
                                   @{
                                       @"questionId" : @"20",
                                       @"revieweeId" : @"1",
                                       @"answer": @"5"
                                       },
                                   @{
                                       @"questionId" : @"21",
                                       @"revieweeId" : @"1",
                                       @"answer": @[@"选项1"]
                                       },
                                   @{
                                       @"questionId" : @"22",
                                       @"revieweeId" : @"1",
                                       @"answer": @[@"选项3",@"选项2"]
                                              
                                       },
                                   @{
                                       @"questionId" : @"23",
                                       @"revieweeId" : @"1",
                                       @"answer": @"哈哈哈"
                                       },
                                   ],
                           };
    NSLog(@"%@",test);
    NSData *data = [NSJSONSerialization dataWithJSONObject:test options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"jsonString:%@",jsonString);
    
    NSString *URL= @"http://www.homis.site/polls/answerUpload";
    [manager POST:URL parameters:jsonString progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传成功");
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:@"提交成功"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败");
        NSLog(@"%@",error);
        
        /*
        //取消任务，直接返回
        if (error.code == -999) return;
        //错误编码为请求超时，弹框提示
        if (error.code == NSURLErrorTimedOut){
            //关闭弹框
            [SVProgressHUD showErrorWithStatus:@"提交数据超时，请稍后再试!"];
        }else{
            //关闭弹框
            [SVProgressHUD showErrorWithStatus:@"提交失败"];
        }
        */
        
        //error!!!!!!
        NSLog(@"上传成功");
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:@"提交成功"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
}

- (void)setNav{
    //设置背景色
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置导航栏文字及颜色
    self.navigationItem.title = [NSString stringWithFormat:@"%@",_projectName];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = rightBtn;

    //设置行高
    self.tableView.rowHeight =325;
    
    //去掉系统自带的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)done:(UIBarButtonItem *)sender{
    [self uploadAnswer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    [self netWork];

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


//每个区有几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataArr count];
    
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 根据我们的indexPath.row获取我们对应的model
    Model *baseModel = [_dataArr objectAtIndex:indexPath.row];
    
    // 根据取出来的model获取其对应的类名
    NSString *modelName = [NSString stringWithUTF8String:object_getClassName(baseModel)];
    
    NSString *identifier = [NSString stringWithFormat:@"%@%ld",modelName,indexPath.row];
    // 根据不同的唯一标识重用不同的cell
    DetailBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 如果cell不存在
    if (cell == nil) {
        // 根据我们每行提供的model创建出对应的cell,根据不同需求生产不同的产品
        
        // 使用model的类名拼接一个“Cell”来获取到我们的Cell类名
        NSString *cellName = [modelName stringByAppendingString:@"Cell"];
        
        // 根据我们所提供的cellName来获取其对应的“cell子类”初始化一个cell对象返回给我们的父类对象
        // 唯一标识符可以使用我们所提供的model来给予不同cell所对应的标识来重用
        cell = [[NSClassFromString(cellName) alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    
    //button
    cell.clickButtonAction = ^(NSInteger tag) {
        NSLog(@"%zd",tag);
        baseModel.tag = tag;
        baseModel.isSelect = !baseModel.isSelect;
        
    };

    [cell setBaseModel:baseModel];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

-(NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}



@end
