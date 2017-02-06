//
//  LGXTwoViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/1/28.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXTwoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    int _count;
}
@property (nonatomic,retain)NSArray *array;
@property (nonatomic,retain)NSArray *imageArray;
@property (nonatomic,retain)UITableView * tabView;
@end
