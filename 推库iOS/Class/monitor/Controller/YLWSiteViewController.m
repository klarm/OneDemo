//
//  YLWSiteViewController.m
//  推库iOS
//
//  Created by Mac on 16/2/17.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWSiteViewController.h"


@implementation YLWSiteViewController 



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.navigationItem.leftBarButtonItem = nil;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20.0f],NSFontAttributeName, nil]];
}

/**
 *  获取站点的数据
 */
-(void)getViewData{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    YLWSiteItemModel *model = self.itemModelArray[indexPath.row];
    
    model.didSelected = YES;
    model.count = @"";
    [self.tableView reloadData];
    YLWContentTableViewController *contentVc = [[YLWContentTableViewController alloc]init];
    contentVc.hidesBottomBarWhenPushed = YES;
    contentVc.title = model.name;
    NSString *urlstring = [NSString stringWithFormat:@"http://api.tuicool.com/api/sites/%@.json?size=30",model.id];
    NSLog(@"%@",urlstring);
    contentVc.urlstring = urlstring;
    [self.navigationController pushViewController:contentVc animated:YES];
}


@end
