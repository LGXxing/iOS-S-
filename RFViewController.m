//
//  RFViewController.m
//  QuiltDemo
//
//  Created by Bryce Redd on 12/26/12.
//  Copyright (c) 2012 Bryce Redd. All rights reserved.
//

#import "RFViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"


@interface RFViewController ()
{
    
    int num;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSMutableArray* numbers;
@end


//int num = 0;

@implementation RFViewController

- (void)viewDidLoad {
    num= 0;
    //self.navigationController.navigationBarHidden =YES;
    self.numbers = [@[] mutableCopy];
    for(; num<50; num++) { [self.numbers addObject:@(num)]; }
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    RFQuiltLayout* layout = (id)[self.collectionView collectionViewLayout];
    layout.direction = UICollectionViewScrollDirectionVertical;
    layout.blockPixels = CGSizeMake(100, 100);
    
    [self.collectionView reloadData];
}
- (IBAction)back:(id)sender {
    ViewController * vc =[[ViewController alloc]init]
    ;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void) viewDidAppear:(BOOL)animated {
//    self.numbers = [@[] mutableCopy];
//    for(; num<50; num++) { [self.numbers addObject:@(num)]; }
//    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    
//    RFQuiltLayout* layout = (id)[self.collectionView collectionViewLayout];
//    layout.direction = UICollectionViewScrollDirectionVertical;
//    layout.blockPixels = CGSizeMake(100, 100);
    
    [self.collectionView reloadData];

    //[self.collectionView reloadData];
}

- (IBAction)remove:(id)sender {
    if(!self.numbers.count) return;
    
    [self.collectionView performBatchUpdates:^{
        int index = arc4random() % self.numbers.count;
        [self.numbers removeObjectAtIndex:index];
        [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]];
    } completion:nil];
}

- (IBAction)add:(id)sender {
    [self.collectionView performBatchUpdates:^{
        int index = arc4random() % self.numbers.count;
        [self.numbers insertObject:@(++num) atIndex:index];
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]];
    } completion:nil];
}

- (UIColor*) colorForNumber:(NSNumber*)num {
    return [UIColor colorWithHue:((19 * num.intValue) % 255)/255.f saturation:1.f brightness:1.f alpha:1.f];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
     NSLog(@"%@",self.numbers);
    return self.numbers.count;
   
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [self colorForNumber:self.numbers[indexPath.row]];
    
    UILabel* label = (id)[cell viewWithTag:5];
    if(!label) label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 20, 20)];
    label.tag = 5;
    label.textColor = [UIColor blackColor];
    label.text = [NSString stringWithFormat:@"%@", self.numbers[indexPath.row]];
    label.backgroundColor = [UIColor clearColor];
    [cell addSubview:label];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    
    
}


#pragma mark – RFQuiltLayoutDelegate

- (CGSize) blockSizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row >= self.numbers.count)
        NSLog(@"Asking for index paths of non-existant cells!! %ld from %lu cells", (long)indexPath.row, (unsigned long)self.numbers.count);
    
    if (indexPath.row % 10 == 0)
        return CGSizeMake(3, 1);
    if (indexPath.row % 11 == 0)
        return CGSizeMake(2, 1);
    else if (indexPath.row % 7 == 0)
        return CGSizeMake(1, 3);
    else if (indexPath.row % 8 == 0)
        return CGSizeMake(1, 2);
    else if(indexPath.row % 11 == 0)
        return CGSizeMake(2, 2);
    if (indexPath.row == 0) return CGSizeMake(5, 5);
    
    return CGSizeMake(1, 1);
}

- (UIEdgeInsets)insetsForItemAtIndexPath:(NSIndexPath *)indexPath {
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
- (void)dealloc
{
    
    
    
    self.collectionView = nil;
}

@end
