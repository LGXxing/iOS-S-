//
//  LGXNineViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/16.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXNineViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain)NSMutableArray *newsArray;
@property (nonatomic,retain)UITableView *MyTableView;
@end
