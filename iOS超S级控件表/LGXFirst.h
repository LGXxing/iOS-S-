//
//  LGXFirst.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/16.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGXFirst : NSObject
@property(nonatomic,copy)NSString *change_name;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *date;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *love;
@property(nonatomic,copy)NSString *comment;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *rowId;
@property(nonatomic,copy)NSString *mainId;
- (instancetype)initWithdic:(NSDictionary *)dic;
@end
