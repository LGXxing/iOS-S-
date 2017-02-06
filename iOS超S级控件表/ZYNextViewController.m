//
//  ZYNextViewController.m
//  iOS超S级控件表
//
//  Created by doone on 16/2/15.
//  Copyright © 2016年 lgx. All rights reserved.
//
# define WIDTH [UIScreen mainScreen].bounds.size.width
# define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "ZYNextViewController.h"
#import "ZYUser.h"
@interface ZYNextViewController ()

@end

@implementation ZYNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.chatArray = [NSMutableArray arrayWithCapacity:0];
    self.navigationItem.title = [NSString stringWithFormat:@"与%@谈判中",self.name];
    self.tableView
    =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH,HEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight =50;
    [self.view addSubview:self.tableView];

    
    UIButton * rightbnt = [UIButton buttonWithType:UIButtonTypeSystem];
    rightbnt.bounds = CGRectMake(0, 0, 60, 40);
    rightbnt.tag = 100;
    
    [rightbnt setTitle:@"0消息" forState:UIControlStateNormal];
    [rightbnt addTarget:self action:@selector(right:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightbntl = [[UIBarButtonItem alloc]initWithCustomView:rightbnt];
    self.navigationItem.rightBarButtonItem = rightbntl;
    
    
    
    _chatView  = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-40, WIDTH, 40)];
    _chatView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_chatView];
    
    _textView  = [[UITextView alloc]initWithFrame:CGRectMake(10, 5, WIDTH-100, 30)];
    _textView.delegate = self;
    [_chatView addSubview:_textView];
    
    
    UIButton *sentbnt = [UIButton buttonWithType:UIButtonTypeCustom];
    sentbnt.frame = CGRectMake(WIDTH-70, 5, 50, 30);
    [sentbnt setTitle:@"发送" forState:UIControlStateNormal];
    [sentbnt setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sentbnt
     setBackgroundImage:[UIImage imageNamed:@"bg_n.png"] forState:UIControlStateNormal];
    sentbnt.titleLabel.font = [UIFont systemFontOfSize:14];
    [sentbnt addTarget:self action:@selector(sendmessage:) forControlEvents:UIControlEventTouchUpInside];
    
    [_chatView addSubview:sentbnt];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardFrameChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapl)];
    [self.tableView addGestureRecognizer:tap];
   
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:212/255.0 green:219/255.0 blue:234/255.0 alpha:1];
    
    
    
    
}
- (void)right:(UIButton *)bnt
{
    
    
    [bnt setTitle:@"0消息" forState:UIControlStateNormal];
    [self.chatArray removeAllObjects];
    [self.tableView reloadData];
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIView* view = [self.chatArray objectAtIndex:indexPath.row];
    return view.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return self.chatArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *chongxie= @"cell";
    
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:chongxie];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:chongxie];
        cell.backgroundColor = [UIColor colorWithRed:212/255.0 green:219/255.0 blue:234/255.0 alpha:1];
    }
    
    
    UIView *view = [cell viewWithTag:99];
    if ([view isKindOfClass:[UIView class]]) {
        [view removeFromSuperview];
    }
    view = [self.chatArray objectAtIndex:indexPath.row];
    [cell addSubview:view];
    
    return cell;
    
}
- (void)sendmessage:(UIButton *)bnt
{
    static BOOL isMyself = NO;
    ZYUser* user = [[ZYUser alloc] init];
    user.chatInfo = _textView.text;
    user.chatTime = [self getCurrentTime];
    user.isMyself = isMyself;
    [self createBubbleWithUser:user];
        _textView.text = @"";
    isMyself = !isMyself;
    
    
}
- (void)createBubbleWithUser:(ZYUser* )user;
{
    
    CGSize size = [user.chatInfo boundingRectWithSize:CGSizeMake(250, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil].size;
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, size.height + 80)];
    view.tag = 99;
    view.backgroundColor = [UIColor clearColor];
    
    
    UIImageView* headerView = [[UIImageView alloc] initWithFrame:CGRectMake(10, size.height + 40, 40, 40)];
    headerView.image = [UIImage imageNamed:@"1.jpg"];
    if (user.isMyself == YES) {
        
        headerView.frame = CGRectMake(WIDTH-50, size.height + 40, 40, 40);
        headerView.image = [UIImage imageNamed:@"2.jpg"];
    }
    headerView.clipsToBounds = YES;
    headerView.layer.cornerRadius = 20;
    [view addSubview:headerView];
   
    
    
    
    if (user.isMyself) {
        UIImageView* bubbleView1 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 20, 265, size.height + 60)];
      UIImage* image = [UIImage imageNamed:@"bubbleSelf.png"];
        image = [image stretchableImageWithLeftCapWidth:22 topCapHeight:15];
        bubbleView1.image = image;
        [view addSubview:bubbleView1];
    }
    else{
        UIImageView* bubbleView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 20, 270, size.height + 60)];
        
        UIImage* image = [UIImage imageNamed:@"bubble.png"];
        image = [image stretchableImageWithLeftCapWidth:22 topCapHeight:15];
        bubbleView.image = image;
        [view addSubview:bubbleView];

    }
    
    
    if (user.isMyself) {
        UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 20, 250, size.height + 60)];
        NSString*message = [NSString stringWithFormat:@"%@:\n\t%@\n%@",@"我",user.chatInfo,user.chatTime];
        label1.text = message;
        label1.textColor = [UIColor blackColor];
        label1.numberOfLines = 0;
        label1.font = [UIFont systemFontOfSize:15];
        [view addSubview:label1];

    }
    else{
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 250, size.height + 60)];
        NSString* message = [NSString stringWithFormat:@"%@:\n\t%@\n%@",self.name,user.chatInfo,user.chatTime];
  
    label.text = message;
    label.textColor = [UIColor blackColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:15];
    [view addSubview:label];
   
    }
    
    [self.chatArray addObject:view];
       [self.tableView reloadData];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.chatArray.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    UIButton* rightbnt = (UIButton* )[self.navigationController.view viewWithTag:100];
    [rightbnt setTitle:[NSString stringWithFormat:@"%d消息",self.chatArray.count] forState:UIControlStateNormal];
}

- (NSString* )getCurrentTime
{
    NSDate* date = [NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView endEditing:YES];
    }
    return YES;
}


- (void)tapl
{
    [self.view endEditing:YES];
    
}
- (void)keyBoardFrameChanged:(NSNotification* )notification
{
    
    CGRect rect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:7];
    _chatView.frame = CGRectMake(0, rect.origin.y - 40, WIDTH, 40);
    self.tableView.frame = CGRectMake(0, 0, WIDTH, _chatView.frame.origin.y);
    [UIView commitAnimations];
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
