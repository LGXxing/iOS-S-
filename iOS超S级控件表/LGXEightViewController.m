//
//  LGXEightViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/15.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXEightViewController.h"

@interface LGXEightViewController ()

@end

@implementation LGXEightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 55;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 5;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    switch (section) {
        case 0:{
            UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, -100, WIDTH, 270)];
            
            [self.tableView addSubview:view];
            
            UIImageView * imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header_bg.jpg"]];
            imageV.frame = view.frame;
            [view addSubview:imageV];
            UIButton * bnt =[UIButton buttonWithType:UIButtonTypeSystem];
            [bnt setTitle:@"您好" forState:UIControlStateNormal];
            [bnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            // [bnt addTarget:self action:@selector(bntClick) forControlEvents:UIControlEventTouchUpInside];
            
            bnt.frame = CGRectMake(WIDTH/2-20, 245, 40, 20);
            [imageV addSubview:bnt];
            UIButton * bnt1 =[UIButton buttonWithType:UIButtonTypeSystem];
            [bnt1 setBackgroundImage:[UIImage imageNamed:@"bjjx@2x.png"] forState:UIControlStateNormal];
            
            bnt1.clipsToBounds = YES;
            bnt1.layer.cornerRadius = 40;
            
            bnt1.frame = CGRectMake(WIDTH/2-40, 160, 80, 80);
            // [bnt1 addTarget:self action:@selector(bntClick) forControlEvents:UIControlEventTouchUpInside];
            [imageV addSubview:bnt1];
            UIView * view1 =[[UIView alloc]initWithFrame:CGRectMake(10, 240, 40, 25)];
            view1.backgroundColor =[UIColor colorWithRed:112/255.0 green:162/255.0 blue:47/255.0 alpha:1];
            view.clipsToBounds =YES;
            view1.layer.cornerRadius = 7;
            [imageV addSubview:view1];
            UIButton * bnt2 =[UIButton buttonWithType:UIButtonTypeSystem];
            [bnt2 setTitle:@"设置" forState:UIControlStateNormal];
            [bnt2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            bnt2.frame =CGRectMake(2, 0, 39, 24);
            [view1 addSubview:bnt2];
            
            
            return view;
        }
            break;
        case 1:
        { UILabel * lab =[[UILabel alloc]init];
            lab.text = @"我的收藏";
            lab.font =[UIFont systemFontOfSize:12];
            lab.frame = CGRectMake(5, 55*3+180, 100, 20);
            [self.tableView addSubview:lab];
            
            return nil;}
            break;
        case 2:
        { UILabel * lab =[[UILabel alloc]init];
            lab.text = @"我的讨论和聊天";
            lab.font =[UIFont systemFontOfSize:12];
            lab.frame = CGRectMake(5, 55*6+225, 100, 20);
            [self.tableView addSubview:lab];
            
            return nil;}
            
            break;
        case 3:{ UILabel * lab =[[UILabel alloc]init];
            lab.text = @"浏览记录";
            lab.font =[UIFont systemFontOfSize:12];
            lab.frame = CGRectMake(5, 55*10+220, 100, 20);
            [self.tableView addSubview:lab];
            return nil;}
            
            
            break;
        case 4:{ UILabel * lab =[[UILabel alloc]init];
            lab.text = @"关于";
            lab.font =[UIFont systemFontOfSize:12];
            lab.frame = CGRectMake(5, 55*14+210, 100, 20);
            [self.tableView addSubview:lab];
            
            return nil;}
            
            break;
        default:
            break;
    }
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 170;
            break;
        case 1:
            
            return 30;
            break;
        case 2:
            return 30;
            break;
        case 3:
            return 30;
            break;
        case 4:
            return 30;
            break;
        default:
            break;
    }
    return 0;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 5) {
        return 50;
    }
    
    return - 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    return nil;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return 3;
            break;
        case 4:
            return 2;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *identif = @"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identif];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identif];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;}
    switch (indexPath.section) {
        case 0:{
            
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = @"文章创作";
                    cell.imageView.image =[UIImage imageNamed:@"usr_write@2x.png"];
                    break;
                case 1:
                    cell.imageView.image =[UIImage imageNamed:@"usr_article@2x.png"];
                    cell.textLabel.text = @"专题搜索";
                    break;
                case 2:cell.imageView.image =[UIImage imageNamed:@"usr_product@2x.png"];
                    cell.textLabel.text = @"商品搜索";
                    break;
                default:
                    break;
            }
            
            return cell;
        }
            break;
        case 1:{
            
            
            switch (indexPath.row) {
                case 0:
                    cell.imageView.image =[UIImage imageNamed:@"usr_product_fav@2x.png"];
                    cell.textLabel.text = @"商品";
                    break;
                case 1:
                    cell.imageView.image =[UIImage imageNamed:@"usr_article_fav@2x.png"];
                    cell.textLabel.text = @"主题";
                    break;
                case 2:cell.imageView.image =[UIImage imageNamed:@"usr_photo_fav@2x"];
                    cell.textLabel.text = @"图片";
                    break;
                default:
                    break;
            }
            
            return cell;
        }
            
            
            break;
        case 2:{
            
            
            switch (indexPath.row) {
                case 0:cell.imageView.image =[UIImage imageNamed:@"usr_discuss@2x.png"];
                    cell.textLabel.text = @"我参与的讨论";
                    break;
                case 1:cell.imageView.image =[UIImage imageNamed:@"usr_chat@2x.png"];
                    cell.textLabel.text = @"私信";
                    break;
                case 2:cell.imageView.image =[UIImage imageNamed:@"usr_message@2x.png"];
                    cell.textLabel.text = @"客服反馈/合作咨询";
                    break;
                default:
                    break;
            }
            
            return cell;
        }
            
            
            break;
        case 3:{
            
            
            switch (indexPath.row) {
                case 0:cell.imageView.image =[UIImage imageNamed:@"usr_product_log@2x.png"];
                    cell.textLabel.text = @"商品";
                    break;
                case 1:cell.imageView.image =[UIImage imageNamed:@"usr_article_log@2x.png"];
                    cell.textLabel.text = @"主题";
                    break;
                case 2:cell.imageView.image =[UIImage imageNamed:@"usr_photo_log@2x.png"];
                    cell.textLabel.text = @"图片";
                    break;
                default:
                    break;
            }
            
            return cell;
        }
            
            
            break;
        case 4:{
            
            
            switch (indexPath.row) {
                case 0:cell.imageView.image =[UIImage imageNamed:@"usr_rate@2x.png"];
                    cell.textLabel.text = @"在AppStore给我们的评分";
                    break;
                case 1:cell.imageView.image =[UIImage imageNamed:@"usr_info@2x.png"];
                    cell.textLabel.text = @"使用指导";
                    break;
                default:
                    break;
            }
            
            return cell;
        }
            
            
            break;
        default:
            break;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
