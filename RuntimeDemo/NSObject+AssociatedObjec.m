//
//  NSObject+AssociatedObjec.m
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//

#import "NSObject+AssociatedObjec.h"

@implementation NSObject (AssociatedObjec)

- (void)setAssociatedObject:(id)associatedObject {
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject {
    return objc_getAssociatedObject(self, _cmd);
}

@end
