//
//  TemplatelistViewController.m
//  QuizDemo
//
//  Created by apple on 2017/4/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TemplateListViewController.h"


@interface TemplateListViewController (){
    NSInteger *test;
}

@end

@implementation TemplateListViewController

- (void)netWork{
    //弹框
    [SVProgressHUD show];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //url
    NSString *url = @"http://www.homis.site/polls/questionnaireList";
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject == nil){
             //关闭弹框
            [SVProgressHUD showErrorWithStatus:@"加载数据失败"];
            return;
        }
        NSLog(@"请求数据成功");
        //responseObject:字典数组
        TemplateList *list = [TemplateList mj_objectWithKeyValues:responseObject];
        NSLog(@"%@",responseObject);
        self.tags = list.result;
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

- (void)dealloc{
    //停止请求
    [SVProgressHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TemplateListCell" bundle:nil] forCellReuseIdentifier:@"TemplateList"];
    //设置背景色
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置导航栏文字及颜色
    self.navigationItem.title = @"模版列表";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];


    //设置行高
    self.tableView.rowHeight = 70;
    
    //去掉系统自带的分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
    [self netWork];

    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tags.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TemplateListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TemplateList"];
    cell.tagModel = self.tags[indexPath.row];
    return cell;
}

//跳转传值
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中cell");
    TemplateListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TemplateList"];
    cell.tagModel = self.tags[indexPath.row];
    TemplateDetailViewController *detailViewController = [[TemplateDetailViewController alloc]init];
    detailViewController.Id = cell.cellId;
    detailViewController.projectName = cell.projectNameLabel.text;
    [self.navigationController pushViewController:detailViewController animated:YES];

}

@end
