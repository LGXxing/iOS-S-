//
//  ZYcardViewController.m
//  大合集
//
//  Created by 123 on 15-8-16.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height

#import "ZYcardViewController.h"
#import "LGXCustomCell.h"

@interface ZYcardViewController ()

@end

@implementation ZYcardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.president.name;
    
    _backUpPresident = [[President alloc] init];
    _backUpPresident.name = self.president.name;
    _backUpPresident.fromYear = self.president.fromYear;
    _backUpPresident.toYear = self.president.toYear;
    _backUpPresident.party = self.president.party;
    
    UIBarButtonItem * cancel =[[UIBarButtonItem alloc]initWithTitle:@"cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancel;
    
    UIBarButtonItem * save = [[UIBarButtonItem alloc]initWithTitle:@"save" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = save;
    
    UITableView * tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0,WIDTH ,HEIGHT ) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 70;
    [tableView registerNib:[UINib nibWithNibName:@"LGXCustomCell" bundle:nil ]forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
    UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(key)];
    
    [tableView addGestureRecognizer:tap];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *chongxie  = @"cell";
    
    LGXCustomCell * cell = [tableView dequeueReusableCellWithIdentifier:chongxie];
        NSString * labtext = @"";
    NSString * textFtext  = @"";
    switch (indexPath.row) {
        case 0:
            labtext = @"name:";
            textFtext  =_backUpPresident.name;
            break;
        case 1:
            labtext = @"fromYear:";
             textFtext  =_backUpPresident.fromYear;
            break;
        case 2:
            labtext = @"toYear:";
             textFtext  =_backUpPresident.toYear ;
            break;
        case 3:
            labtext = @"party:";
             textFtext  = _backUpPresident.party;
            break;
        default:
            break;
            
    }
    cell.lab.text = labtext;
    cell.lab.text = labtext;
      cell.text.text = textFtext;
    cell.text.delegate =self;
    cell.text.tag = indexPath.row +10;
    
    return cell;
}
- (void)textFieldDidEndEditing:(UITextField *)text;
{
    switch (text.tag) {
        case 10:
            _backUpPresident.name = text.text;
            break;
        case 11:
            _backUpPresident.fromYear = text.text;
            break;
        case 12:
            _backUpPresident.toYear = text.text;
            
            break;
        case 13:
            _backUpPresident.party = text.text;
            break;
        default:
            break;
    }
    
    
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)cancel
{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)save


{
    [self.view endEditing:YES];
    self.president.name = _backUpPresident.name;
    self.president.fromYear =_backUpPresident.fromYear;
    self.president.toYear=_backUpPresident.toYear;
    self.president.party=_backUpPresident.party;
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)key
{
    
    [self.view endEditing:YES];
}
- (void)dealloc
{
    
}



@end
