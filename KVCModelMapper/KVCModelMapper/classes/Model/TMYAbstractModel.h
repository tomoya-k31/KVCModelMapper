//
//  TMYAbstractModel.h
//  KVCModelMapper
//
//  Created by 角田 智哉 on 2014/10/20.
//  Copyright (c) 2014年 角田 智哉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMYAbstractModel : NSObject

+ (instancetype)modelFromJson:(NSDictionary *)json;

- (void)initValuesWithJson:(NSDictionary *)json;

@end
