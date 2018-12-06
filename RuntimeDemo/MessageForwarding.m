//
//  MessageForwarding.m
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//

#import "MessageForwarding.h"

@implementation MessageForwarding

- (void)sendMessage:(NSString *)word
{
    NSLog(@"fast forwarding way : send message = %@", word);
}

+ (void)class_SendMessage:(NSString *)word {
    NSLog(@"fast forwarding way : class_sendMessage = %@", word);
}

@end
