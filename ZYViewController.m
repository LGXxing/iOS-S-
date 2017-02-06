//
//  ZYViewController.m
//  collectViewTest
//
//  Created by 兴哥的世界,别烦我 on 15-10-7.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ZYViewController.h"
#import "ZYcustomcell.h"
#import "ZYcusTomTwoCell.h"
@interface ZYViewController ()

@end

@implementation ZYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];

    layout.minimumInteritemSpacing =0;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = 0;
    layout.itemSize = CGSizeMake(WIDTH, HEIGHT);
    collect =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:layout];
    collect.backgroundColor = [UIColor whiteColor];
    collect.delegate = self;
    collect.dataSource =self;
    //collect.backgroundColor = [UIColor clearColor];
    [collect registerNib:[UINib nibWithNibName:@"ZYcustomcell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [collect registerNib:[UINib nibWithNibName:@"ZYcusTomTwoCell" bundle:nil] forCellWithReuseIdentifier:@"cell1"];
    collect.pagingEnabled = YES;
    [self.view addSubview:collect];
    
    
}
# pragma  mark CollectionView 的代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    return 2;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 8;
            break;
        case 1:
            return 100;
            break;
        default:
            return 0;
            break;
    }
    
    
    
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section ==1) {
        
    
    
    ZYcustomcell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.8];
    cell.lab.text =  @"天下无敌大将军吕布奉先";
    cell.imageV.image = [UIImage imageNamed:@"1.jpg"];
        cell.lab.numberOfLines = 2;
    
        return cell;
    }
    else{
        ZYcusTomTwoCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        
        cell.ImageV.image = [UIImage imageNamed:@"2.jpg"];
        return cell;
        
    }
       
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(320, 110);
    }else{
        
    
    return CGSizeMake(85, 110);
    }
}

//设置单元格上下左右边界
//有默认最小边界
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(20, 10, 10, 10);
}


//设置行间距的最小值
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}
//设置列间距最小值
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 20;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
{
    [collect deselectItemAtIndexPath:indexPath animated:YES];
    ZYcustomcell *cell =(ZYcustomcell *)[collect cellForItemAtIndexPath:indexPath];
    cleanView =[UIView new];
    
    cleanView.frame = CGRectMake(0, 0, 85, 117);
    
    cleanView.backgroundColor = [UIColor darkGrayColor];
    cleanView.alpha = 0.5;
    [cell addSubview:cleanView];
    if (!timer) {
        
    
        timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTime:) userInfo:indexPath repeats:YES];
    }
    
    NSLog(@"123");
}

# pragma  mark 定时器点击事件
- (void)onTime:(NSIndexPath*)indexPath{
   
    NSLog(@"4856");
    
    [UIView animateWithDuration:0.5 animations:^{
 
        CGRect rect = cleanView .frame;
        rect.size.height -=10;
        cleanView.frame = rect;
        NSLog(@"%f",rect.size.height);
        
        if (rect.size.height <0) {
            [timer invalidate];
            [self alear:@"下载完成"];
            timer =nil;
        }
    }];
    
    
    
}
# pragma mark 警告框
- (void)alear: (NSString*)message
{
    UIAlertView *alear =[[UIAlertView alloc]initWithTitle:@"温馨提示" message:message  delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [alear show];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
