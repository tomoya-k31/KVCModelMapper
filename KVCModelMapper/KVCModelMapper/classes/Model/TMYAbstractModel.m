//
//  TMYAbstractModel.m
//  KVCModelMapper
//
//  Created by 角田 智哉 on 2014/10/20.
//  Copyright (c) 2014年 角田 智哉. All rights reserved.
//

#import "TMYAbstractModel.h"
#import "NSObject+TMYKvc.h"

@implementation TMYAbstractModel

#pragma mark - class method
+ (instancetype)modelFromJson:(NSDictionary *)json
{
    return [[self alloc] initWithJson:json];
}

#pragma mark - private method
- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        [self initValuesWithJson:json];
    }
    
    return self;
}

- (void)initValuesWithJson:(NSDictionary *)json
{
    for (NSString *key in json) {
        [self setValue:json[key] forKey:key];
    }
}


#pragma mark - override
- (id)init
{
    // [[self alloc] init] & [self new] 禁止
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (NSString *)description
{
    NSMutableString *descriptionString = [NSMutableString new];
    [descriptionString appendString:[NSString stringWithFormat:@"%@\n", [super description]]];
    NSArray *allKeys = [[self class] allKeys];
    
    [allKeys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
        NSString *appendedString = [NSString stringWithFormat:@"%@ : %@ \n", key, [self valueForKey:key]];
        [descriptionString appendString:appendedString];
    }];
    
    return [NSString stringWithString:descriptionString];
}

@end
