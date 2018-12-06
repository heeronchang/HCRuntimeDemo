//
//  NSObject+AssociatedObjec.h
//  RuntimeDemo
//
//  Created by Zhang Hailing on 2017/9/26.
//  Copyright © 2017年 Heeron Chang. All rights reserved.
//
// 利用分类给现有类添加属性

#import <Foundation/Foundation.h>

@interface NSObject (AssociatedObjec)

@property (strong, nonatomic) id associatedObject;

@end
