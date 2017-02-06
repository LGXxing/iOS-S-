//
//  LGXendViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/3/11.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGXendViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>


@property (nonatomic,retain)NSMutableArray *array;
@property (nonatomic,retain)NSArray *imageArray;

@end
