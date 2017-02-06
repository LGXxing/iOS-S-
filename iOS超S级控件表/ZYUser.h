//
//  ZYUser.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/15.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYUser : NSObject
@property(nonatomic,copy)NSString* chatInfo;//聊天内容
@property(nonatomic,assign)BOOL isMyself;//是不是自己发的信息
@property(nonatomic,copy)NSString* chatTime;//保存的是聊天的时间

@end
