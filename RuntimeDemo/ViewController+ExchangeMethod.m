//
//  ViewController+ExchangeMethod.m
//  RuntimeDemo
//
//  Created by Heeron on 2018/12/6.
//  Copyright © 2018 Heeron Chang. All rights reserved.
//

#import "ViewController+ExchangeMethod.h"

@implementation ViewController (ExchangeMethod)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod([self class], @selector(printA:));
        Method swizzlingMethod = class_getInstanceMethod([self class], @selector(printB:));
        
        BOOL addSuccess = class_addMethod([self class], @selector(printA:), method_getImplementation(swizzlingMethod), method_getTypeEncoding(swizzlingMethod));
        if (addSuccess) {
            class_replaceMethod([self class], @selector(printB:), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzlingMethod);
        }
    });
}

- (void)printB:(NSString *)string {
    NSLog(@"printB:%@", string);
}

@end
