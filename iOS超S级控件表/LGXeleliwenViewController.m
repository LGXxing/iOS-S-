//
//  LGXeleliwenViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/18.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXeleliwenViewController.h"

@interface LGXeleliwenViewController ()

@end

@implementation LGXeleliwenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imageArray = [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36", nil];
    self.sectionArray = [NSMutableArray arrayWithObjects:@"至高之神",@"终极强者",@"路路凡人", nil];
    NSMutableArray* array1 = [NSMutableArray arrayWithObjects:@"贝克巴姆",@"红发香克斯",@"白胡子",@"凯多", nil];
    NSMutableArray* array2 = [NSMutableArray arrayWithObjects:@"路飞",@"基德",@"罗",@"索隆",@"艾斯",@"萨博",@"山治", nil];
    NSMutableArray* array3 = [NSMutableArray arrayWithObjects:@"巴基",@"斯摩格",@"艾尼路",@"不死鸟",@"火云邪神", nil];
    self.rowArray = [NSMutableArray arrayWithObjects:array1,array2,array3, nil];
    self.tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.rowHeight =50;
    [self.view addSubview:self.tabView];
    
    self.tabView.sectionHeaderHeight = 40;
    _openSectionIndex = 0;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArray.count;
}

//自定义区头
- (UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, WIDTH, 40);
    [button addTarget:self action:@selector(sectionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = section;
    button.backgroundColor = [UIColor lightGrayColor];
    [button setTitle:[self.sectionArray objectAtIndex:section] forState:UIControlStateNormal];
    
    //表示打开或者关闭的箭头
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    if (section == _openSectionIndex) {
        //让一个试图旋转多少度
        imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    imageView.image = [UIImage imageNamed:@"jiantou.png"];
    [button addSubview:imageView];
        return button;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //判断是不是当前要打开的区，是的话返回响应的行数，不是则返回0
    if (section == _openSectionIndex) {
        NSArray* array = [self.rowArray objectAtIndex:section];
        return array.count;
    }else
    {
        return 0;
    }
}
- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    //NSArray* imageArray = [self.imageArray objectAtIndex:indexPath.section];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[self.imageArray objectAtIndex:indexPath.row]]];
    
    NSArray* nameArray = [self.rowArray objectAtIndex:indexPath.section];
    cell.textLabel.text = [nameArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)sectionButtonClick:(UIButton* )btn
{
    //改变当前要打开的区号
    _openSectionIndex = btn.tag;
    
    //刷新表：重新执行代理方法
    //(NSUInteger)  要刷新的区号
    NSIndexSet* set = [NSIndexSet indexSetWithIndex:_openSectionIndex];
    
    //先刷新所有的区
    [self.tabView reloadData];
    //在具体刷新某个区
    [self.tabView reloadSections:set withRowAnimation:UITableViewRowAnimationMiddle];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
