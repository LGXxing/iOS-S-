//
//  ViewController.m
//  iOS超S级控件表
//
//  Created by doone on 15/11/25.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "LGXOneViewController.h"
#import "LGXTwoViewController.h"
#import "LGXThreeViewController.h"
#import "LGXForeViewController.h"
#import "LGXFiveViewController.h"
#import "LGXSixViewController.h"
#import "LGXSevenViewController.h"
#import "LGXEightViewController.h"
#import "LGXNineViewController.h"
#import "RFViewController.h"
#import "ZYViewController.h"
#import "LGXTenViewController.h"
#import "LGXeleliwenViewController.h"
#import "LGXTwinsViewController.h"
#import "LGXendViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self.navigationController.navigationBar setTintColor:[UIColor greenColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    self.navigationController.navigationBarHidden= NO;
       self.array = [[NSArray alloc]initWithObjects:@"基础表",@"单选表",@"多选表",@"微信聊天",@"总统表",@"plist文件表",@"表移动",@"设置分组表",@"数据请求表",@"瀑布流",@"表布局",@"表插入",@"单表开合",@"多表开合",@"表移动", nil];
    self.imageArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15", nil];
    
    
    UITableView * tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.rowHeight = 80;

    
    
    

    [self.view addSubview:tabView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.array.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString * identifilly = @"cell";
    
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifilly];
    
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:identifilly];
        

    }
    cell.textLabel.text = [NSString stringWithFormat:@"🌹%@🌼",self.array[indexPath.row]];
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"20%@.jpg",self.imageArray[indexPath.row]]];
    cell.imageView.layer.cornerRadius = 40;
    cell.imageView.clipsToBounds = YES;
    cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * vc = nil;
    switch (indexPath.row) {
        case 0:
            vc = [[LGXOneViewController alloc]init];
            break;
        case 1:
            vc = [[LGXTwoViewController alloc]init];
            break;
        case 2:
            vc = [[LGXThreeViewController alloc]init];
            break;
        case 3:
            vc = [[LGXForeViewController alloc]init];
            break;
        case 4:
            vc = [[LGXFiveViewController alloc]init];
            break;
        case 5:
            vc = [[LGXSixViewController alloc]init];
            break;
        case 6:
            vc = [[LGXSevenViewController alloc]init];
            break;
        case 7:
            vc = [[LGXEightViewController alloc]init];
            break;
        case 8:
            vc = [[LGXNineViewController alloc]init];
            break;
        case 9:
            vc = [[RFViewController alloc]init];
            break;
        case 10:
            vc = [[ZYViewController alloc]init];
            break;
        case 11:
            vc = [[LGXTenViewController alloc]init];
            break;
        case 12:
            vc = [[LGXeleliwenViewController alloc]init];
            break;
        case 13:
            vc = [[LGXTwinsViewController alloc]init];
            break;
        case 14:
            vc = [[LGXendViewController alloc]init];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
