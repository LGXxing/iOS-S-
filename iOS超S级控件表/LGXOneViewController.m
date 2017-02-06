//
//  LGXOneViewController.m
//  iOS超S级控件表
//
//  Created by doone on 15/11/28.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXOneViewController.h"
#import "LGXOneTableViewCell.h"
#import "LGXreginViewController.h"
@interface LGXOneViewController ()

@end

@implementation LGXOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"基础表";
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    UITableView * tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    tabView.delegate = self;
    tabView.dataSource = self;
    tabView.rowHeight =100;
    self.array = [[NSArray alloc]initWithObjects:@"天魁星 呼保义 宋江",@"天罡星 玉麒麟 卢俊义",@"天机星 智多星 吴用",@"天闲星 入云龙 公孙胜",@"天勇星 大刀 关胜",@"天雄星 豹子头 林冲",@"天猛星 霹雳火 秦明",@"天威星 双鞭 呼延灼",@"天英星 小李广 花荣",@"天贵星 小旋风 柴进",@"天富星 扑天雕 李应",@"天満星 美髯公 朱仝",@"天孤星 花和尚 鲁智深",@"天伤星 行者 武松",@"天立星 双枪将 董平",@"天捷星 没羽箭 张清",@"天暗星 青面獣 杨志",@"天佑星 金枪手 徐宁",@"天空星 急先锋 索超",@"天速星 神行太保 戴宗",@"天异星 赤髪鬼 刘唐",@"天杀星 黒旋风 李逵",@"天微星 九纹龙 史进",@"天究星 没遮拦 穆弘",@"天退星 挿翅虎 雷横",@"天寿星 混江龙 李俊",@"天剣星 立地太歳 阮小二",@"天平星 船火児 张横",@"天罪星 短命二郎 阮小五",@"天损星 浪里白跳 张顺",@"天败星 活阎罗 阮小七",@"天牢星 病关索 杨雄",@"天慧星 拚命三郎 石秀",@" 天暴星 两头蛇 解珍",@"天哭星 双尾蝎 解宝",@"天巧星 浪子 燕青", nil];
    self.imageArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36", nil];
        [self.view addSubview:tabView];
    [tabView registerNib:[UINib nibWithNibName:@"LGXOneTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.array.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString * identifilly = @"cell";
    
    LGXOneTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:identifilly];
    
    if (cell == nil) {
        cell =[[LGXOneTableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:identifilly];}
        cell.headImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.imageArray[indexPath.row]]];
    cell.headImage.clipsToBounds = YES;
    cell.headImage.layer.cornerRadius = 45;
        cell.timeLab.text = @"上午10:10";
    if (indexPath.row%2==1) {
        cell.heardLab.text = @"梁山好汉全伙在此";
    }else{
        cell.heardLab.text = @"替天行道，惩恶扬善";
    }
        cell.nickName.text = self.array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LGXreginViewController * vc =[[LGXreginViewController alloc]init];
    vc.imageName = self.imageArray[indexPath.row];
    vc.nickN  =self.array[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
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
