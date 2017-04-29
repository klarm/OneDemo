//
//  ViewController.m
//  代码创建UICollectionView
//
//  Created by 陈家庆 on 15-2-6.
//  Copyright (c) 2015年 shikee_Chan. All rights reserved.
//

#import "storeViewController.h"
#import "storeCell.h"

NSString * const strMyMainPage = @"主页";


#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)

@interface storeViewController ()

@end

@implementation storeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20.0f],NSFontAttributeName, nil]];
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.title = strMyMainPage;
    
    /**
     *  创建collectionView self自动调用setter getter方法
     */
    [self.view addSubview:self.collectionView];
    
    /**
     *  广告栏
     */
//    _headerView = [[AdvertisingColumn alloc]initWithFrame:CGRectMake(5, 5, fDeviceWidth-10, AD_height)];
//    _headerView.backgroundColor = [UIColor blackColor];
    
    /**
     *  加载的数据
     */
    NSArray *imgArray = [NSArray arrayWithObjects:@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png",@"cat.png", nil];

    NSDictionary* item0 = @{
        @"title" : @"4.3度",
        @"subTitle" : @"1号仓库"
    };
    
    NSDictionary* item1 = @{
                            @"title" : @"4.5度",
                            @"subTitle" : @"2号仓库"
                            };
    
    NSDictionary* item2 = @{
                            @"title" : @"14.5度",
                            @"subTitle" : @"3号仓库"
                            };
    
    NSDictionary* item3 = @{
                            @"title" : @"3.5度",
                            @"subTitle" : @"5号仓库"
                            };

    
    if (!_cellArray) {
        _cellArray = [NSMutableArray array];
    }

    [_cellArray addObject:item0];
    [_cellArray addObject:item1];
    [_cellArray addObject:item2];
    [_cellArray addObject:item3];
}

#pragma mark - 创建collectionView并设置代理
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, fDeviceWidth, fDeviceHeight) collectionViewLayout:flowLayout];
        
        //定义每个UICollectionView 的大小
        flowLayout.itemSize = CGSizeMake((fDeviceWidth-20)/2, (fDeviceWidth-20)/2);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = 0;
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = 0;
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 5, 5);//上左下右
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[storeCell class] forCellWithReuseIdentifier:@"storeCell"];
        
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        //背景颜色
        _collectionView.backgroundColor = [UIColor whiteColor];
        
         _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
    }
    return _collectionView;
}


#pragma mark - UICollectionView delegate dataSource
#pragma mark 定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_cellArray count];
}

#pragma mark 定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark 每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"storeCell";
    storeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
     [cell sizeToFit];
    
    if (indexPath.row < _cellArray.count) {
        NSDictionary* dic = _cellArray[indexPath.row];
        [cell setCellData:dic];
    }

    return cell;
}

#pragma mark UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择%ld",indexPath.item);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
