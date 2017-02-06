//
//  LGXThreeViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/1/28.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXThreeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain)NSMutableArray *array;
@property (nonatomic,retain)NSArray *nameArray;
@property (nonatomic,retain)NSArray *imageArray;
@property (nonatomic,retain)UITableView * tabView;
@end
