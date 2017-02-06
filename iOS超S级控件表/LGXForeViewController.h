//
//  LGXForeViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/1/28.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXForeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (retain,nonatomic)NSMutableArray *sectionArray;
@property (retain,nonatomic)NSMutableArray * rowArray;
@property (retain,nonatomic)NSMutableArray * imageArray;
@property (retain,nonatomic)UITableView * tabView;
@end
