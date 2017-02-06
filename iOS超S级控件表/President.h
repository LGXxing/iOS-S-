//
//  President.h
//  大合集
//
//  Created by 123 on 15-8-16.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface President : NSObject<NSCopying>
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* fromYear;
@property(nonatomic,copy)NSString* toYear;
@property(nonatomic,copy)NSString* party;


@end
