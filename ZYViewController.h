//
//  ZYViewController.h
//  collectViewTest
//
//  Created by 兴哥的世界,别烦我 on 15-10-7.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    UICollectionView * collect;
    NSTimer *timer;
    UIView *cleanView;
}

@end
