//
//  LGXreginViewController.m
//  iOS超S级控件表
//
//  Created by doone on 15/12/1.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "LGXreginViewController.h"

@interface LGXreginViewController ()

@end

@implementation LGXreginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = [NSString stringWithFormat:@"%@",self.nickN];
    UIImageView * imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    
    imageView.image= [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",self.imageName]];
    NSLog(@"%@",self.imageName);
    [self.view addSubview:imageView];
    
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
