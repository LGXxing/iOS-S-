//
//  LGXTenViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/18.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXTenViewController.h"

@interface LGXTenViewController ()

{
    UITableView * tabView;
}
@end

@implementation LGXTenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.rowHeight =100;
    self.array = [[NSMutableArray alloc]initWithObjects:@"天魁星 呼保义 宋江",@"天罡星 玉麒麟 卢俊义",@"天机星 智多星 吴用",@"天闲星 入云龙 公孙胜", nil];
    self.imageArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39", nil];
    [self.view addSubview:tabView];
    tabView.sectionHeaderHeight = 50;
}
- (UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    view.backgroundColor = [UIColor cyanColor];
    
    //添加一个label
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 30)];
    label.text = @"梁山好汉";
    [view addSubview:label];
  
    
    //添加一个add的button
    UIButton* addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(WIDTH-70, 0, 50, 50);
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    //[addButton setBackgroundImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    addButton.tag = section;
    [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:addButton];
    return view;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//返回表的编辑的样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.array.count;
}
- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifoer = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifoer];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifoer];
    }
    //cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
    cell.imageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.imageArray[indexPath.row]]];
    
    //NSArray* array = [self.array objectAtIndex:indexPath.section];
    cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}

- (void)addButtonClick:(UIButton* )button
{
    //self.tableView.editing表的编辑
    //1.self.tableView.editing = !self.tableView.editing;
   
    //2.直接添加
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"友情提示" message:@"请输入要添加的name" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"sure", nil];
    //alertView.tag = button.tag;
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //sure
    if (buttonIndex == 1) {
        //获取输入的内容
        UITextField* textField = [alertView textFieldAtIndex:0];
        //改变数据源
        //NSMutableArray* array = [self.array objectAtIndex:1];
        [self.array addObject:textField.text];
        //刷新表(刷新插入操作)
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [tabView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
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
