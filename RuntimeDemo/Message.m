//
//  Message.m
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//

#import "Message.h"
#import "NSObject+AssociatedObjec.h"

@implementation Message

//********* 消息发送机制**************
/// 1 exits
//- (void)sendMessage:(NSString *)word
//{
//    NSLog(@"normal way : send message = %@", word);
//    NSObject *obj = [NSObject new];
//    obj.associatedObject = @"利用分类给现有类添加属性";
//    NSLog(@"%@",obj.associatedObject);
//}

/// 2 Method Resolution
+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(sendMessage:)) {
//        // 其中 “v@:” 表示返回值和参数
//        class_addMethod(object_getClass(self), sel, class_getMethodImplementation([self class], @selector(myInstanceMethod:)), "v@:");
//
//        return YES;
//    }
//
//    return [super resolveInstanceMethod:sel];
    
    return NO;
}

+ (BOOL)resolveClassMethod:(SEL)sel {
//    if (sel == @selector(class_SendMessage:)) {
//        class_addMethod(object_getClass(self), sel, class_getMethodImplementation(object_getClass(self), @selector(myClassMethod:)), "v@:");
//
//        return YES;
//    }
//
//    return [super resolveClassMethod:sel];
    
    return NO;
}

- (void)myInstanceMethod:(NSString *)string {
    NSLog(@"myInstanceMethod-parameter:%@", string);
}

+ (void)myClassMethod:(NSString *)string {
    NSLog(@"myClassMethod-parameter:%@", string);
}

/// 3 Fast Forwarding
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(sendMessage:)) {
//        return [MessageForwarding new];
//    }

    return nil;
}

+ (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(class_SendMessage:)) {
        return [MessageForwarding class];
    }
    
    return nil;
}

/// 4.1 Normal Forwarding
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSegnature = [super methodSignatureForSelector:aSelector];
    if (!methodSegnature) {
        methodSegnature = [NSMethodSignature signatureWithObjCTypes:"v@*"];
    }
    
    return methodSegnature;
}

/// 4.2
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    MessageForwarding *messageForwarding = [MessageForwarding new];
    if ([messageForwarding respondsToSelector:anInvocation.selector]) {
        [anInvocation invokeWithTarget:messageForwarding];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

//**************

- (void)printString:(NSString *)string {
    NSLog(@"%@",string);
}

@end
