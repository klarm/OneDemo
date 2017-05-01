//
//  YLWContentTableViewController.m
//  推库iOS
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWContentTableViewController.h"
#import "YLWArticleModel.h"
#import "YLWStoreMonitorCell.h"
#import "storeInfoCell.h"
#import "YLWDetailTextViewController.h"
#import <Masonry.h>
@interface YLWContentTableViewController ()
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,strong) NSArray *cellModelArray;
@end

@implementation YLWContentTableViewController

#pragma mark - 懒加载
-(NSArray *)cellModelArray{
    
    if (_cellModelArray == nil) {
        _cellModelArray = [[NSArray alloc]init];
    }
    return _cellModelArray;
}

#pragma mark - 视图生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.navigationItem.leftBarButtonItem = nil;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20.0f],NSFontAttributeName, nil]];
    
    [self getData];
    
}

-(void)viewDidAppear:(BOOL)animated{
    //只是在第一次显示的时候加载  之后都是重用
    [super viewDidAppear:animated];
    NSLog(@"显示");
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    NSLog(@"消失");
}

-(void)getData{
    
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"stores" ofType:@"json"]];
    
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *dataArray = [dataDic objectForKey:self.type == 0 ? @"stores0" : @"stores1"];
    
    self.cellModelArray = dataArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.dataCatoryType == 1) {
        return 1;
    }
    else{
        return 2;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.dataCatoryType == 1) {
        return 1;
     }
    else{
        if (section == 0) {
            return 1;
        }else{
            return _cellModelArray.count;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (self.dataCatoryType == 1) {
         return self.tableView.frame.size.height;
     }
     else{
         return 50;
     }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.dataCatoryType == 1) {
        //主页二级页
        if (_myIndex == 0) {
            
            storeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeInfoCell"];
            
            if (!cell) {
                cell = [[storeInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"storeInfoCell"];
            }
            
            [cell setCellImage:[UIImage imageNamed:@"storeInfo0.jpg"]];
            
            return cell;
        }else if (_myIndex == 1){
            
            storeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeInfoCell"];
            
            if (!cell) {
                cell = [[storeInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"storeInfoCell"];
            }

            [cell setCellImage:[UIImage imageNamed:@"storeInfo1.jpg"]];
            
            return cell;
            
        }else  if (_myIndex == 2){
            
            storeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeInfoCell"];
            
            if (!cell) {
                cell = [[storeInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"storeInfoCell"];
            }
            
            [cell setCellImage:[UIImage imageNamed:@"storeInfo2.jpg"]];
            
            return cell;
            
        }else{
            
            storeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeInfoCell"];
            
            if (!cell) {
                cell = [[storeInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"storeInfoCell"];
            }
            
            [cell setCellImage:[UIImage imageNamed:@"storeInfo3.jpg"]];
            
            return cell;
            
        }
    }else{
        if (indexPath.section == 0) {
            YLWStoreMonitorSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YLWStoreMonitorSearchCell"];
            
            if (!cell) {
                cell = [[YLWStoreMonitorSearchCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YLWStoreMonitorSearchCell"];
            }
            
            return cell;
        }
        
        if (indexPath.section == 1) {
            if (self.type == 0) {
                YLWStoreMonitorCell0 *cell = [tableView dequeueReusableCellWithIdentifier:@"YLWStoreMonitorCell0"];
                
                if (!cell) {
                    cell = [[YLWStoreMonitorCell0 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YLWStoreMonitorCell0"];
                }
                
                NSDictionary* dic = nil;
                if (indexPath.row < _cellModelArray.count) {
                    dic = _cellModelArray[indexPath.row];
                }
                
                [cell setCellData:dic];
                
                return cell;
                
            }else if (self.type == 1){
                YLWStoreMonitorCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"YLWStoreMonitorCell1"];
                
                if (!cell) {
                    cell = [[YLWStoreMonitorCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"YLWStoreMonitorCell1"];
                }
                
                NSDictionary* dic = nil;
                if (indexPath.row < _cellModelArray.count) {
                    dic = _cellModelArray[indexPath.row];
                }
                
                [cell setCellData:dic];
                
                
                return cell;
            }
        }
    }
    
    NSAssert(NO, @"");
     UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    
    return cell;
}

#pragma mark 按钮的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    YLWArticleModel *model = self.articleModelArray[indexPath.row];
//    
//    
//    
//    if (self.navigationController) {
//        
//        YLWDetailTextViewController *detail = [[YLWDetailTextViewController alloc]init];
//        
//        //        detail.hidesBottomBarWhenPushed = YES;
//        
//        detail.detailTextId = model.id;
//        
//        [self.navigationController pushViewController:detail animated:YES];
//        
//        
//    }else{
//        
//        [[NSNotificationCenter defaultCenter]postNotificationName:YLWPushToDetailTextVCNotification object:nil userInfo:@{YLWDetailTextIdKeyd:model.id}];
//        
//    }
}

@end
