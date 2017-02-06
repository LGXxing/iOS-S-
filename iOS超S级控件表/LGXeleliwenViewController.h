//
//  LGXeleliwenViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXeleliwenViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

    
    {
        int _openSectionIndex;//保存的是，当前打开区的区号
    }


@property (retain,nonatomic)NSMutableArray *sectionArray;
@property (retain,nonatomic)NSMutableArray * rowArray;
@property (retain,nonatomic)NSMutableArray * imageArray;
@property (retain,nonatomic)UITableView * tabView;

@end
