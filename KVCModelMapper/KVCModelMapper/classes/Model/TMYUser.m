//
//  TMYUser.m
//  KVCModelMapper
//
//  Created by 角田 智哉 on 2014/10/19.
//  Copyright (c) 2014年 角田 智哉. All rights reserved.
//

#import "TMYUser.h"
#import "TMYAddress.h"

@implementation TMYUser

#pragma mark - override method
- (void)initValuesWithJson:(NSDictionary *)json
{
    NSDictionary *map = [self mappingProperties];
    
    [json enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        if ([self respondsToSelector:NSSelectorFromString(map[key])]) {
            if ([@"address" isEqualToString:key]) {
                [self setValue:[TMYAddress modelFromJson:json[key]] forKey:map[key]];
            } else {
                [self setValue:json[key] forKey:map[key]];
            }
        }
    }];
}

- (NSDictionary *)mappingProperties
{
    NSDictionary *map = @{@"user_id":@"userId",
                          @"full_name":@"fullName",
                          @"nick_name":@"nickName",
                          @"address":@"address",
                          @"birth_date":@"birthDate"};
    return map;
}
@end
