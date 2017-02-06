//
//  LGXFiveViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/1/28.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXFiveViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSArray *array;
@property (nonatomic,retain)NSString*name;
@property (nonatomic,retain)UITableView * tabView;
@end
