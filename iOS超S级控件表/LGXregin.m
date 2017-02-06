//
//  LGXregin.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/16.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "LGXregin.h"
#import "AFNetworking.h"
#import "LGXFirst.h"
@implementation LGXregin
+ (void)getNew:(newblock)block;
{
    AFHTTPRequestOperationManager *manage =[AFHTTPRequestOperationManager manager];
    
    [manage GET:@"http://api.smzdm.com/v1/home/articles?f=iphone&have_zhuanti=1&imgmode=0&limit=20&v=6.0"parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *array =responseObject[@"data"][@"rows"];
        
        NSMutableArray * array2 =[NSMutableArray array];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            LGXFirst *user = [[LGXFirst alloc]initWithdic:obj];
            [array2 addObject:user];
        }];
        if (block){
            
            block(array2);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

@end
