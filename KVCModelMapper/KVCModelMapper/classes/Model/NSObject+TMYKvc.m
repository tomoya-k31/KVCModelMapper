//
//  NSObject+TMYKvc.m
//  KVCModelMapper
//
//  Created by 角田 智哉 on 2014/10/20.
//  Copyright (c) 2014年 角田 智哉. All rights reserved.
//

#import "NSObject+TMYKvc.h"
#import <objc/objc-runtime.h>

@implementation NSObject (TMYKvc)

+ (NSArray *)allKeys
{
    u_int count;
    
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertyArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        [propertyArray addObject:@(propertyName)];
    }
    
    free(properties);
    
    return [NSArray arrayWithArray:propertyArray];
}

- (NSString *)description
{
    NSMutableString *descriptionString = [NSMutableString new];
    NSArray *allKeys = [[self class] allKeys];
    
    [allKeys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
        NSString *appendedString = [NSString stringWithFormat:@"%@ : %@ \n", key, [self valueForKey:key]];
        [descriptionString appendString:appendedString];
    }];
    
    return [NSString stringWithString:descriptionString];
}

@end
