//
//  LGXTwinsViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXTwinsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


{
    bool _flag[2];//保存的是区号
}


@property (retain,nonatomic)NSMutableArray *sectionArray;
@property (retain,nonatomic)NSMutableArray * rowArray;
@property (retain,nonatomic)NSMutableArray * imageArray;
@property (retain,nonatomic)UITableView * tabView;


@end
