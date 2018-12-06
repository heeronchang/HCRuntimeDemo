//
//  UIViewController+Logging.m
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//

#import "UIViewController+Logging.h"

@implementation UIViewController (Logging)

/*
 一般情况下，类别里的方法会重写掉主类里相同命名的方法。如果有两个类别实现了相同命名的方法，只有一个方法会被调用。但 +load: 是个特例，当一个类被读到内存的时候， runtime 会给这个类及它的每一个类别都发送一个 +load: 消息
 */
+ (void)load {
    // 确保先调用替换方法
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
}

- (void)swizzled_viewDidAppear:(BOOL)animated {
    [self swizzled_viewDidAppear:animated];
    
    NSLog(@"Category<Logging>: swizzled method");
}

/// 替换方法
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    
    /*
     先尝试添加原 selector 是为了做一层保护，因为如果这个类没有实现 originalSelector ，但其父类实现了，那 class_getInstanceMethod 会返回父类的方法。这样 method_exchangeImplementations 替换的是父类的那个方法，这当然不是你想要的。所以我们先尝试添加 orginalSelector ，如果已经存在，再用 method_exchangeImplementations 把原方法的实现跟新的方法实现给交换掉。
     最后，我们只需要确保在程序启动的时候调用 swizzleMethod 方法
     */
    BOOL didAddedMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddedMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
