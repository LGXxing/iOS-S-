//
//  ZYcardViewController.h
//  大合集
//
//  Created by 123 on 15-8-16.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "President.h"

@interface ZYcardViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
        President* _backUpPresident;
    
}
@property(nonatomic,retain)President*president;
@end
