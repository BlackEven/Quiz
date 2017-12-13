//
//  Login.m
//  QuizDemo
//
//  Created by apple on 2017/4/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "Login.h"
#import "TemplateListViewController.h"

@interface Login ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;


@end

@implementation Login{
    NSDictionary *dic;
}


- (void)deviceLogin{
    //推送请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://www.homis.site/polls/deviceLogin";
    //推送的设备id
    NSString *test = @"565abdb24d5a406744a90a18b0543940";
    NSDictionary *parameters = @{
                                 @"deviceId":test,
                                 };
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"终端认证成功");
        NSLog(@"--------返回的数据：%@",responseObject);
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"终端认证"
                                                                       message:@"设备已注册，点击确定自动登录"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                              handler:^(UIAlertAction * action) {
                                                                 
                                                              }];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  [self autoLogin];
                                                              }];

       
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"终端认证失败");
        NSLog(@"%@",error);
    }];
}

- (void)autoLogin{
    UIStoryboard *myStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController*secondVC = [myStoryboard  instantiateViewControllerWithIdentifier:@"templateNavController"];
    
    [self presentViewController:secondVC animated:YES completion:nil];
    
    NSLog(@"跳转");
}
/*
- (void)userLogin{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSString *url = @"http://www.homis.site/polls/userLogin";
    NSString *username = self.userName.text;
    NSString *password = self.password.text;
    // 请求参数
    NSDictionary *parameters = @{
                                 @"username":username,
                                 @"password":password,
                                 };
    
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"用户登录成功");
        NSLog(@"--------返回的数据：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"用户登录失败");
        NSLog(@"%@",error);
    }];
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self deviceLogin];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
