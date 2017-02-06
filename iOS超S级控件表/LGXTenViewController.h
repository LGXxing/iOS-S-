//
//  LGXTenViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/18.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXTenViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>


@property (nonatomic,retain)NSMutableArray *array;
@property (nonatomic,retain)NSArray *imageArray;
@end
