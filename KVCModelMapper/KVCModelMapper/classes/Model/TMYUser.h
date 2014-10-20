//
//  TMYUser.h
//  KVCModelMapper
//
//  Created by 角田 智哉 on 2014/10/19.
//  Copyright (c) 2014年 角田 智哉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMYAbstractModel.h"

@class TMYAddress;
@interface TMYUser : TMYAbstractModel

@property (nonatomic) TMYAddress *address;

@property NSUInteger userId;
@property NSUInteger point;
@property (nonatomic) NSString *fullName;
@property (nonatomic) NSString *nickName;
@property (nonatomic) NSString *birthDate;

//+ (instancetype)modelFromJson:(NSDictionary *)json;

@end
