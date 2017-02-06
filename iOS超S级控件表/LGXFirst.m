//
//  LGXFirst.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/16.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "LGXFirst.h"

@implementation LGXFirst
- (instancetype)initWithdic:(NSDictionary *)dic;
{
    
    
    LGXFirst * user =[[LGXFirst alloc]init];
    user.change_name = dic[@"article_channel_name"];
    user.title =  dic[@"article_title"];
    user.date = dic[@"article_format_date"];
    user.price = dic[@"article_price"];
    user.love = dic[@"article_love_count"];
    user.comment = dic[@"article_comment"];
    user.image = dic[@"article_pic"];
    user.url = dic[@"article_url"];
    user.rowId =dic[@"article_id"];
    user.mainId = dic[@"article_channel_id"];
    
    return user;
    
}

@end
