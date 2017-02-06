//
//  LGXThreeViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/1/28.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXThreeViewController.h"
//#import "ZYCustomCell.h"
#import "LGXduoxuancell.h"
@interface LGXThreeViewController ()

@end

@implementation LGXThreeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.array = [NSMutableArray arrayWithContentsOfFile:[self getPath]];
    if (self.array==nil) {
        
        
        self.array = [NSMutableArray arrayWithCapacity:0];}
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.rowHeight = 80;
    [self.tabView registerNib:[UINib nibWithNibName:@"LGXduoxuancell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellp"];
    //[self.tabView registerNib:[UINib nibWithNibName:@"ZYCustomCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellp"];
    self.nameArray = [[NSMutableArray alloc]initWithObjects:@"天魁星 呼保义 宋江",@"天罡星 玉麒麟 卢俊义",@"天机星 智多星 吴用",@"天闲星 入云龙 公孙胜",@"天勇星 大刀 关胜",@"天雄星 豹子头 林冲",@"天猛星 霹雳火 秦明",@"天威星 双鞭 呼延灼",@"天英星 小李广 花荣",@"天贵星 小旋风 柴进",@"天富星 扑天雕 李应",@"天満星 美髯公 朱仝",@"天孤星 花和尚 鲁智深",@"天伤星 行者 武松",@"天立星 双枪将 董平",@"天捷星 没羽箭 张清",@"天暗星 青面獣 杨志",@"天佑星 金枪手 徐宁",@"天空星 急先锋 索超",@"天速星 神行太保 戴宗",@"天异星 赤髪鬼 刘唐",@"天杀星 黒旋风 李逵",@"天微星 九纹龙 史进",@"天究星 没遮拦 穆弘",@"天退星 挿翅虎 雷横",@"天寿星 混江龙 李俊",@"天剣星 立地太歳 阮小二",@"天平星 船火児 张横",@"天罪星 短命二郎 阮小五",@"天损星 浪里白跳 张顺",@"天败星 活阎罗 阮小七",@"天牢星 病关索 杨雄",@"天慧星 拚命三郎 石秀",@" 天暴星 两头蛇 解珍",@"天哭星 双尾蝎 解宝",@"天巧星 浪子 燕青", nil];
    self.imageArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36", nil];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(date) name:UIApplicationDidEnterBackgroundNotification object:nil];
     [self.view addSubview:self.tabView];
}
- (NSString*)getPath
{
    return [NSHomeDirectory()stringByAppendingPathComponent: @"Documents/data.plist"];
    
    
}
- (void)date
{NSLog(@"*****");
    
    [self.array writeToFile:[self getPath] atomically:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return self.nameArray.count;
  

    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString * CellIdentifier = @"cellp";
    
   LGXduoxuancell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
       cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.imageArray[indexPath.row]]];
    cell.image.clipsToBounds = YES;
    cell.image.layer.cornerRadius =36;
    cell.name.text = self.nameArray[indexPath.row];
    cell.bnt.tag = indexPath.row;
    [cell.bnt setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
    
    
    
    for (NSNumber* number in self.array) {
        if ([number intValue] == indexPath.row) {
            //在，设置为star2
            [cell.bnt setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
            break;
        }
    }
    
    [cell.bnt addTarget:self action:@selector(bntClic:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.tabView deselectRowAtIndexPath:indexPath animated:YES];
    LGXduoxuancell* cell = (LGXduoxuancell* )[tableView cellForRowAtIndexPath:indexPath];
    
    BOOL is = NO;
    for (NSNumber* number in self.array) {
        if (indexPath .row == [number intValue])
        {
            is = YES;
            break;
        }
    }
    if (is==YES) {[self.array removeObject:[NSNumber numberWithInt:indexPath.row]];
        [cell.bnt setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
        
    }else
    {
        [self.array addObject:[NSNumber numberWithInt:indexPath .row ]];
        
        [cell.bnt  setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
    }
    
    
}
- (void)bntClic:(UIButton*)bnt
{
    BOOL is = NO;
    for (NSNumber* number in self.array) {
        if (bnt.tag == [number intValue])
        {
            is = YES;
            break;
            
        }
    }
    if (is==YES) {NSLog(@"123");
        [self.array removeObject:[NSNumber numberWithInt:bnt.tag]];
        [bnt setBackgroundImage:[UIImage imageNamed:@"star1.png"] forState:UIControlStateNormal];
        
    }else
    {
        [self.array addObject:[NSNumber numberWithInt:bnt.tag]];
        
        [bnt setBackgroundImage:[UIImage imageNamed:@"star2.png"] forState:UIControlStateNormal];
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
