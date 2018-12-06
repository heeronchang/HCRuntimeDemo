//
//  Message.h
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageForwarding.h"

@interface Message : NSObject

+ (void)class_SendMessage:(NSString *)word;
- (void)sendMessage:(NSString *)word;
- (void)printString:(NSString *)string;

@end
