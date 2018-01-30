//
//  ViewController.m
//  xiaomifengAllTest
//
//  Created by 🐝小蜜蜂🐝 on 2018/1/30.
//  Copyright © 2018年 🐝小蜜蜂🐝. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *urlStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //https://www.jianshu.com/u/63a43b4286de
    
    //上面的是我的简书地址，欢迎围观，小蜜蜂🐝在此谢谢啦！
    
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 44)];
    [btn1 addTarget:self action:@selector(buttonBoundMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundColor:[UIColor blueColor]];
    [btn1 setTitle:@"https://www.jianshu.com/u/63a43b4286de" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 180, [UIScreen mainScreen].bounds.size.width, 44)];
    [btn2 addTarget:self action:@selector(buttonBoundMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setBackgroundColor:[UIColor redColor]];
    [btn2 setTitle:@"http://www.baidu.com" forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 260, [UIScreen mainScreen].bounds.size.width, 44)];
    [btn3 addTarget:self action:@selector(buttonBoundMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setBackgroundColor:[UIColor orangeColor]];
    [btn3 setTitle:@"https://www.jianshu." forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, 340, [UIScreen mainScreen].bounds.size.width, 44)];
    [btn4 addTarget:self action:@selector(buttonBoundMethod:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setBackgroundColor:[UIColor purpleColor]];
    [btn4 setTitle:@"小蜜蜂" forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    
}




/**
 * 网址正则验证
 *
 *  @param string 要验证的字符串
 *
 *  @return 返回值类型为BOOL
 */
- (BOOL)urlValidation:(NSString *)string {
    
    NSError *error;
    // 正则表达式
    NSString *regulaStr =@"^(?=^.{3,255}$)(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+(:\d+)*(\/\w+\.\w+)*([\?&]\w+=\w*)*$";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches){
        
        NSString *substringForMatch = [string substringWithRange:match.range];
        
        self.urlStr = substringForMatch;//把网址传出去
        
        return YES;
    }
    return NO;
}



//每个按钮绑定的方法
-(void)buttonBoundMethod:(UIButton *)button
{
    
    
    
    if ([self urlValidation:button.titleLabel.text]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"下面的是网址" message:button.titleLabel.text preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"打开" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            //这里还可以做想做是网址的事情，比如这里是点击“打开”之后把网址打开
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:button.titleLabel.text] options:@{} completionHandler:nil];
            
            
        }]];
        
        // 弹出对话框
        [self presentViewController:alert animated:true completion:nil];
        
    }
    
    else
    {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"下面的不是网址" message:button.titleLabel.text preferredStyle:UIAlertControllerStyleAlert];
      [alert addAction:[UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //这里还可以做想做不是网址的事情
        
    }]];
        
        // 弹出对话框
        [self presentViewController:alert animated:true completion:nil];
        
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
