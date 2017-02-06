//
//  LGXregin.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/16.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "LGXFirst.h"
typedef void(^newblock)(NSArray*array);

@interface LGXregin : NSObject
+ (void)getNew:(newblock)block;


@end
