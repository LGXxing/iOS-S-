//
//  LGXFiveViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/1/28.
//  Copyright © 2016年 lgx. All rights reserved.
//

#import "LGXFiveViewController.h"
#import "President.h"
#import "ZYcardViewController.h"
@interface LGXFiveViewController ()

@end

@implementation LGXFiveViewController
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:YES];
    [self.tabView reloadData];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tabView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.rowHeight =80;
    [self.view addSubview:self.tabView];
    NSString *filePath = [self getFilePath];
    
    if (![[NSFileManager defaultManager]
          fileExistsAtPath:filePath])
    {
        filePath =
        [[NSBundle mainBundle]pathForResource:@"Presidents" ofType:@"plist"];
        
    }
    
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    NSKeyedUnarchiver * un =[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    self.array = [un decodeObjectForKey:@"Presidents"];
    
    [un finishDecoding];
   
    
    self.tabView.rowHeight = 60;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(save) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void)save
{
    NSMutableData *data = [NSMutableData dataWithCapacity:0];
    NSKeyedArchiver * ach =[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [ach encodeObject:self.array forKey:@"Presidents"];
    
    [ach finishEncoding];
    [data writeToFile:[self getFilePath] atomically:YES];
    
    
    
    
}

- (NSString *)getFilePath
{
    
    return [NSHomeDirectory()
            stringByAppendingPathComponent:@"Documents/Presidents.plist"];
    
    
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
        cell =[[UITableViewCell alloc]initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:identifilly];}
    President* president = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text = president.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ --%@",president.fromYear,president.toYear];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self.tabView deselectRowAtIndexPath:indexPath animated:YES];
    ZYcardViewController *vc=[[ZYcardViewController alloc]init];
    vc.president= [self.array objectAtIndex:indexPath.row];
    
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
