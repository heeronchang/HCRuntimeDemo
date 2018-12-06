//
//  ViewController.m
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "ViewController+ExchangeMethod.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Message *message = [[Message alloc] init];
    [message sendMessage:@"hello world!"];
    [Message class_SendMessage:@"class call"];
    
    [self printA:@"hello,"];
    [self printB:@"world!"];
}

- (void)printA:(NSString *)string {
    NSLog(@"printA-%@",string);
}

//- (void)printB:(NSString *)string {
//    NSLog(@"printB-%@", string);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
