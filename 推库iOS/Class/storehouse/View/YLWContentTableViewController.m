//
//  YLWContentTableViewController.m
//  推库iOS
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWContentTableViewController.h"
#import "YLWArticleModel.h"
#import "YLWNewsTableViewCell.h"
#import "YLWDetailTextViewController.h"
#import <Masonry.h>

@interface YLWContentTableViewController ()
@end

@implementation YLWContentTableViewController


#pragma mark - 视图生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.tableView.rowHeight = 73;
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self getData];
        [self.tableView.mj_header endRefreshing];
        
    }];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        
        [self footGetData];
        
        [self.tableView.mj_footer endRefreshing];
        
    }];

    [self getNetWorkstate];
    
    [self getData];
    
}

-(void)getNetWorkstate{
}


-(void)footGetData{
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

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //YLWArticleModel *model = self.articleModelArray[indexPath.item];
    
    NSString *ID = @"";

    YLWNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        if ([ID isEqualToString:@"YLWNewsTableViewCell"]) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"YLWNewsTableViewCell" owner:nil options:nil] lastObject];
        }else{
        
            cell = [[[NSBundle mainBundle] loadNibNamed:@"YLWNewsTableViewCell" owner:nil options:nil] firstObject];
            
        }
        
    }
    
    
    //cell.articleModel = model;
    
    return cell;
}

#pragma mark 按钮的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.navigationController) {
        
        YLWDetailTextViewController *detail = [[YLWDetailTextViewController alloc]init];
        
//        detail.hidesBottomBarWhenPushed = YES;
        
        //detail.detailTextId = model.id;
        
        [self.navigationController pushViewController:detail animated:YES];

        
    }else{
    
//        [[NSNotificationCenter defaultCenter]postNotificationName:YLWPushToDetailTextVCNotification object:nil userInfo:@{YLWDetailTextIdKeyd:model.id}];
    
    }
    
}





@end
