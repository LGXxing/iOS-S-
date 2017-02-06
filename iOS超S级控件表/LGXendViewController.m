//
//  LGXendViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/3/11.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXendViewController.h"

@interface LGXendViewController ()

{
    UITableView * tabView;
}
@end

@implementation LGXendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    tabView.delegate = self;

    tabView.dataSource = self;
    tabView.rowHeight =100;
    self.array = [[NSMutableArray alloc]initWithObjects:@"天魁星 呼保义 宋江",@"天罡星 玉麒麟 卢俊义",@"天机星 智多星 吴用",@"天闲星 入云龙 公孙胜",@"天勇星 大刀 关胜",@"天雄星 豹子头 林冲",@"天猛星 霹雳火 秦明",@"天威星 双鞭 呼延灼",@"天英星 小李广 花荣",@"天贵星 小旋风 柴进",@"天富星 扑天雕 李应",@"天満星 美髯公 朱仝",@"天孤星 花和尚 鲁智深",@"天伤星 行者 武松",@"天立星 双枪将 董平",@"天捷星 没羽箭 张清",@"天暗星 青面獣 杨志",@"天佑星 金枪手 徐宁",@"天空星 急先锋 索超",@"天速星 神行太保 戴宗",@"天异星 赤髪鬼 刘唐",@"天杀星 黒旋风 李逵",@"天微星 九纹龙 史进",@"天究星 没遮拦 穆弘",@"天退星 挿翅虎 雷横",@"天寿星 混江龙 李俊",@"天剣星 立地太歳 阮小二",@"天平星 船火児 张横",@"天罪星 短命二郎 阮小五",@"天损星 浪里白跳 张顺",@"天败星 活阎罗 阮小七",@"天牢星 病关索 杨雄",@"天慧星 拚命三郎 石秀",@" 天暴星 两头蛇 解珍",@"天哭星 双尾蝎 解宝",@"天巧星 浪子 燕青", nil];
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
    
    
    //添加一个yidong的button
    UIButton* addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(WIDTH-70, 0, 50, 50);
    [addButton setTitle:@"移动" forState:UIControlStateNormal];
    //[addButton setBackgroundImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    addButton.tag = section;
    [addButton addTarget:self action:@selector(rightBar:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:addButton];
    return view;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //NSLog(@"sourceIndexPath = %d %d  destinationIndexPath = %d %d",sourceIndexPath.section,sourceIndexPath.row,destinationIndexPath.section,destinationIndexPath.row);
    //过程：删除源数据，插入到新的位置，刷新表
    
    //找到源数据
    NSString*info = [self.array objectAtIndex:sourceIndexPath.row];
    
    [self.array removeObject:info];
    
    [self.array insertObject:info atIndex:destinationIndexPath.row];
    
    [tableView reloadData];
}

//返回表的编辑的样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
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
bool is;
- (void)rightBar:(UIButton*)right

{
    tabView.editing = !tabView.editing;
    is=!is;
    [right setTitle:is?@"完成":@"移动" forState:UIControlStateNormal];

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
