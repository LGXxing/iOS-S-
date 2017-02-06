//
//  LGXSixViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/15.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXSixViewController.h"

@interface LGXSixViewController ()

@end

@implementation LGXSixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView * tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.rowHeight =50;
    [self.view addSubview:tabView];
    if
        ([[NSFileManager defaultManager]fileExistsAtPath:[self filePath]])
    {
        self.array = [NSMutableArray arrayWithContentsOfFile:[self filePath]];
        
    }
    else
        
    {
        
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"computers" ofType:@"plist"];
        
        
        
        self.array = [NSMutableArray arrayWithContentsOfFile:filePath];
    }

}
- (NSString *)filePath
{
    
    return [NSHomeDirectory()stringByAppendingPathComponent:@"Documents/move.plist"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *chongxie = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:chongxie];
    if (!cell) {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:chongxie];
        
    }
    cell.textLabel.text =[self.array objectAtIndex:indexPath.row];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
