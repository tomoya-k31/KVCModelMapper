//
//  ViewController.m
//  KVCModelMapper
//
//  Created by 角田 智哉 on 2014/10/19.
//  Copyright (c) 2014年 角田 智哉. All rights reserved.
//

#import "ViewController.h"
#import "TMYUser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"user" ofType:@"json"];
    NSError *error = nil;
    NSString *jsonStr = [NSString stringWithContentsOfFile:jsonPath
                                                  encoding:NSUTF8StringEncoding
                                                     error:&error];
    if (error) {
        NSLog(@"%@", error);
        return;
    }
    
    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData
                                                 options:NSJSONReadingAllowFragments
                                                   error:&error];
    
    if (error) {
        NSLog(@"%@", error);
        return;
    }
    
    NSLog(@"%@", jsonObj);
    TMYUser *user = [TMYUser modelFromJson:jsonObj];
    NSLog(@"%@", user);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
