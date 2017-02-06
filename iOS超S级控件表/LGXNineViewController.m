//
//  LGXNineViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/16.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXNineViewController.h"
#import "LGXregin.h"
#import "LGXFirst.h"
#import "UIImageView+WebCache.h"
#import "LGXNewsTableViewCell.h"
@interface LGXNineViewController ()

@end

@implementation LGXNineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.MyTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.MyTableView.rowHeight = 150;
    self.MyTableView.delegate =self;
    self.MyTableView.dataSource =self;
    [self.view addSubview:self.MyTableView];
        [LGXregin getNew:^(NSArray *array) {
        self.newsArray =[NSMutableArray arrayWithArray:array
                        
];
            NSLog(@"%@",self.newsArray);

     
        [self.MyTableView reloadData];
    
    }];
    [self.MyTableView registerNib:[UINib nibWithNibName:@"LGXNewsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
     
     }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.newsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{    static NSString *ident = @"cell";
    
    LGXNewsTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:ident];
    LGXFirst *user = self.newsArray[indexPath.row];
    NSLog(@"%@",self.newsArray);
    cell.title.text = user.title;
    cell.title.numberOfLines = 2;
    cell.title.textColor =[UIColor grayColor];
    cell.name.text = user.price;
    cell.name.textColor =[UIColor redColor];
    cell.lab.text = [NSString stringWithFormat:@"%@ | %@",user.change_name,user.date];
    cell.lab.textColor =[UIColor grayColor];
    cell.lab1.text =[NSString stringWithFormat:@"评论%@ 值（100）",user.comment];
    cell.lab1.textColor =[UIColor grayColor];
    NSURL *url =[NSURL URLWithString:user.image];
    [cell.imageV sd_setImageWithURL:url];
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
