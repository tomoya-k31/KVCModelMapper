//
//  TMYAddress.h
//  KVCModelMapper
//
//  Created by 角田 智哉 on 2014/10/19.
//  Copyright (c) 2014年 角田 智哉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMYAbstractModel.h"

@interface TMYAddress : TMYAbstractModel

@property (nonatomic) NSString *zip;
@property (nonatomic) NSString *city;

@end
