//
//  ZYNextViewController.h
//  iOS超S级控件表
//
//  Created by doone on 16/2/15.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZYNextViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
    
    UIView* _chatView;
    UITextView * _textView;
    
    
    
    
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,copy)NSString* name;
@property(nonatomic, retain)NSMutableArray *chatArray;
@end
