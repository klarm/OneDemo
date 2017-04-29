//
//  YLWTopicViewController.m
//  推库iOS
//
//  Created by Mac on 16/2/17.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWTopicViewController.h"
#import "YLWTopicItemModel.h"
#import "YLWSiteItemTableViewCell.h"
#import "YLWContentTableViewController.h"

NSString * const strLogoImg = @"头像";
NSString * const strTime = @"时间";
NSString * const strHouse = @"库";
NSString * const strName = @"姓名";
NSString * const strTiming = @"考勤";

@interface YLWTopicViewController ()
@property (nonatomic,strong) UIView *headerView;
@end

@implementation YLWTopicViewController


- (void)viewDidLoad {
    [super viewDidLoad];
     self.tableView.rowHeight = 73;
}

#pragma mark - 获取数据
-(void)getViewData{
    
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"employees" ofType:@"json"]];
    
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *dataArray = [dataDic objectForKey:@"employees"];
    
    self.itemModelArray = [YLWSiteItemModel initWithArray:dataArray];
    
    [self.tableView reloadData];
    
    self.tableView.tableHeaderView = self.headerView;
}

-(UIView *)headerView{    
    
    if (_headerView == nil) {
        _headerView = [[UIView alloc]init];
        _headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
        
        UILabel* img = [[UILabel alloc]initWithFrame:CGRectZero];
        img.backgroundColor = [UIColor grayColor];
        img.text = strLogoImg;
        [_headerView addSubview:img];
        
        UILabel* time = [[UILabel alloc]initWithFrame:CGRectZero];
        //time.backgroundColor = [UIColor grayColor];
        time.text = strTime;
        [_headerView addSubview:time];
        
        UILabel* house = [[UILabel alloc]initWithFrame:CGRectZero];
        //house.backgroundColor = [UIColor grayColor];
        house.text = strHouse;
        [_headerView addSubview:house];
        
        UILabel* name = [[UILabel alloc]initWithFrame:CGRectZero];
        //name.backgroundColor = [UIColor grayColor];
        name.text = strName;
        [_headerView addSubview:name];
        
        UILabel* timing = [[UILabel alloc]initWithFrame:CGRectZero];
        //timing.backgroundColor = [UIColor grayColor];
        timing.text = strTiming;
        [_headerView addSubview:timing];
        
        [img sizeToFit];
        [img setX:10];
        [img setCenterY:_headerView.height/2.0];
        
        [time sizeToFit];
        [time setX:img.right+10];
        [time setCenterY:_headerView.height/2.0];
        
        [house sizeToFit];
        [house setX:time.right+10];
        [house setCenterY:_headerView.height/2.0];
        
        [name sizeToFit];
        [name setX:house.right+10];
        [name setCenterY:_headerView.height/2.0];
        
        [timing sizeToFit];
        [timing setX:name.right+10];
        [timing setCenterY:_headerView.height/2.0];

    }
    return _headerView;
}

#pragma mark - Tableview 代理和数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.itemModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YLWSiteItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SiteCellIdentifier"];
    
    if (cell == nil) {
        cell= [[YLWSiteItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SiteCellIdentifier"];
    }
    
    YLWSiteItemModel *model = self.itemModelArray[indexPath.row];
    
    cell.siteItemModel = model;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YLWTopicItemModel *model = self.itemModelArray[indexPath.row];
    model.didSelected = YES;
    model.count = @"";
    [self.tableView reloadData];
    YLWContentTableViewController *contentVc = [[YLWContentTableViewController alloc]init];
    contentVc.hidesBottomBarWhenPushed = YES;
    contentVc.title = model.name;
    NSString *urlstring = [NSString stringWithFormat:@"http://api.tuicool.com/api/topics/%@.json?lang=1&size=30&st=0",model.id];
    contentVc.urlstring = urlstring;
    [self.navigationController pushViewController:contentVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
