//
//  LGXForeViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/1/28.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXForeViewController.h"
#import "ZYNextViewController.h"

@interface LGXForeViewController ()

@end

@implementation LGXForeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"强者世界";
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
    
    }


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    
    
    return  self.sectionArray.count;
    
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIButton *bnt =[UIButton buttonWithType:UIButtonTypeCustom];
    bnt.frame = CGRectMake(0, 0, 320, 30);
    
    bnt.backgroundColor = [UIColor redColor];
    
    bnt.tag = section;
    [bnt addTarget:self action:@selector(bntClick:) forControlEvents:UIControlEventTouchUpInside ];
    UILabel * lab = [[UILabel alloc]initWithFrame: CGRectMake(10, 5, 100, 30)];
    
    lab.text= [self.sectionArray objectAtIndex:section];
    [bnt addSubview:lab];
    lab.font = [UIFont systemFontOfSize:20];
    [self.view bringSubviewToFront:bnt];
    
    return bnt;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        
        
        NSArray* array= [self.rowArray objectAtIndex:section];
        
        return array.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *chongyong = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:chongyong];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:chongyong];
        
    }
    
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.imageArray[indexPath.row]]];
    //cell.imageView.image = [UIImage imageNamed:@"6.jpg"]
    //;
    NSArray *array = [self.rowArray objectAtIndex:indexPath.section];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    //cell.imageView.layer.cornerRadius = 20;
    //cell.imageView.clipsToBounds = YES;
    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZYNextViewController* vc =[[ZYNextViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    NSMutableArray *array =[self.rowArray objectAtIndex:indexPath.section];
    
    vc.name = [array objectAtIndex:indexPath.row];
    
    
    
    
    
    
    
}

- (void)bntClick:(UIButton *)bnt

{
    
    [self.tabView reloadSections:[NSIndexSet indexSetWithIndex:bnt.tag] withRowAnimation:UITableViewRowAnimationFade];
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
