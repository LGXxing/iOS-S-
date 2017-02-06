//
//  ViewController.h
//  iOS超S级控件表
//
//  Created by doone on 15/11/25.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)NSArray * array;
@property (nonatomic,retain)NSArray *imageArray;

@end

