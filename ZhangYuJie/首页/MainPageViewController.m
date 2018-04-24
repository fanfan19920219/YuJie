//
//  MainPageViewController.m
//  ZhangYuJie
//
//  Created by Star J on 2018/2/21.
//  Copyright © 2018年 Star J. All rights reserved.
//

#import "MainPageViewController.h"
#import "Header.h"

@interface MainPageViewController ()
@property (strong, nonatomic) IBOutlet UITextView *showWeatheView;
@property (strong, nonatomic)NSMutableArray *futureArray;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _showWeatheView.layer.cornerRadius = 3;
    _futureArray = [[NSMutableArray alloc]init];
    self.navigationController.toolbarHidden = YES;
    NSLog(@"hahaha");
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)weather:(id)sender {
    
    [self getMethod];
    
    return;
    
    selectView *selectview = [[selectView alloc]initWithFrame:CGRectMake(30, 50, 200, 100)];
    
    [self.view addSubview:selectview];
    
    
    
    NSLog(@"weather --- %@",@"天气");
}

-(IBAction)takePhone:(id)sender{
    NSString *urlString = [NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",@"406608969"];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
    
    return;
    
    //
//    NSString *urlString = [NSString stringWithFormat:@"tel://%@",@"15539136809"];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

-(void)getMethod{
    //天气预报appkey
    //d6d0f33cd03adea637daf364a6a47a13
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [MBProgressHUD setAccessibilityLabel:@"加载中..."];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript", nil]];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    NSString *URL = @"https://v.juhe.cn/weather/index?format=2&cityname=焦作&key=d6d0f33cd03adea637daf364a6a47a13";
    
    NSString* encodedString = [URL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [manager GET:encodedString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    }
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             @try {
                 //执行的代码，如果异常,就会抛出，程序不继续执行啦
                 
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 NSLog(@"这里打印请求成功要做的事");
                 NSString *result = [[NSString alloc] initWithData:responseObject  encoding:NSUTF8StringEncoding];
                 NSDictionary *resultDic = [self dictionaryWithJsonString:result];
                 
                 //解析字符串
                 //future
                 _futureArray = [[resultDic objectForKey:@"result"] objectForKey:@"future"];
                 
                 NSLog(@"futherDic --- %@",_futureArray);
                 
                 NSString *cityString = [NSString stringWithFormat:@"%@",[[[resultDic objectForKey:@"result"] objectForKey:@"today"] objectForKey:@"city"]];
                 
                 //weather
                 NSString *toDayString = [NSString stringWithFormat:@"%@ %@",[[_futureArray objectAtIndex:0] objectForKey:@"weather"],[[[resultDic objectForKey:@"result"] objectForKey:@"today"] objectForKey:@"temperature"]];
                 
                 NSString *tomorrowDayString = [NSString stringWithFormat:@"%@ %@",[[_futureArray objectAtIndex:1] objectForKey:@"weather"],[[_futureArray objectAtIndex:1] objectForKey:@"temperature"]];
                 NSString *afterDayString = [NSString stringWithFormat:@"%@ %@",[[_futureArray objectAtIndex:2] objectForKey:@"weather"],[[_futureArray objectAtIndex:2] objectForKey:@"temperature"]];
                 
                 NSString *showString = [NSString stringWithFormat:@" %@\n  今天：%@ \n  明天：%@ \n  后天：%@",cityString,toDayString,tomorrowDayString,afterDayString];
                 
                 _showWeatheView.text = showString;
                 
             } @catch (NSException *exception) {
                 //捕获异常
             } @finally {
                 //这里一定执行，无论你异常与否
             }
             
         }
     
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
             NSLog(@"fail --- %@",error);  //这里打印错误信息
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         }];
    
}


-(void)setWeather:(NSDictionary*)dic{
    @try {
        //执行的代码，如果异常,就会抛出，程序不继续执行啦
        
        
        
    } @catch (NSException *exception) {
        //捕获异常
    } @finally {
        //这里一定执行，无论你异常与否
    }
}


- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
    
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

