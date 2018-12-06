//
//  MessageForwarding.h
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageForwarding : NSObject

- (void)sendMessage:(NSString *)word;  
+ (void)class_SendMessage:(NSString *)word;

@end
