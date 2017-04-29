
//
//  YLWUserViewController.m
//  推库iOS
//
//  Created by Mac on 16/2/17.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWUserViewController.h"
#import "YLWUserItemModel.h"
#import "YLWUserGroupModel.h"
#import "YLWUserLoginCell.h"
#import "YLWUserLoginController.h"
#import "YLWUserInfoViewController.h"
#import "YLWContentTableViewController.h"
#import "myStringDef.h"

@interface YLWUserViewController ()

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,assign) BOOL isLogin;

@end

@implementation YLWUserViewController

-(BOOL)isLogin{

    return [YLWUserLoginModel sharedUserLoginModel].isLogin;

}

-(NSArray *)dataArray{

    if (_dataArray== nil) {
        YLWUserItemModel *model00 = [YLWUserItemModel userItemModelWithName:@"点击登录" icon:@"default_avatar"];
        YLWUserGroupModel *group0 = [YLWUserGroupModel userGroupModelWithModelArray:@[model00]];
        
        YLWUserItemModel *model10 = [YLWUserItemModel userItemModelWithName:strChangePassword];
        YLWUserItemModel *model11 = [YLWUserItemModel userItemModelWithName:strProblems];
        YLWUserItemModel *model12 = [YLWUserItemModel userItemModelWithName:strServiceTel];
        YLWUserItemModel *model13 = [YLWUserItemModel userItemModelWithName:strUpdate];
        YLWUserItemModel *model14 = [YLWUserItemModel userItemModelWithName:strAboutUs];
        YLWUserGroupModel *group1 = [YLWUserGroupModel userGroupModelWithModelArray:@[model10,model11,model12,model13,model14]];
        
        YLWUserItemModel *model20 = [YLWUserItemModel userItemModelWithName:strLastloginTime];
        YLWUserItemModel *model21 = [YLWUserItemModel userItemModelWithName:strLoginOut];
        YLWUserGroupModel *group2 = [YLWUserGroupModel userGroupModelWithModelArray:@[model20,model21]];
        
        _dataArray = @[group0,group1,group2];
    }

    return _dataArray;
}

+(instancetype)userview{

    UIStoryboard *st = [UIStoryboard storyboardWithName:@"YLWUserViewController" bundle:nil];
    
    YLWUserViewController *user = [st instantiateInitialViewController];
    
    return user;

}

-(instancetype)init{

    return [super initWithStyle:UITableViewStyleGrouped];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.tableView.sectionHeaderHeight = 1;
    self.tableView.sectionFooterHeight = 18;
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 1)];

    self.navigationItem.leftBarButtonItem = nil;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loginSuccess) name:@"YLWUserLoginControllerLoginSuccess" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 登录成功
-(void)loginSuccess{

    [self.tableView reloadData];
}

#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.dataArray.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataArray[section] itemModelArray].count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YLWUserGroupModel *group = self.dataArray[indexPath.section];
    YLWUserItemModel *itemModel = group.itemModelArray[indexPath.row];
    
    
    NSString *loginIdentifier = @"";
    
    if (indexPath.section == 0) {
        
        loginIdentifier = @"loginIdentifier0";
        
        YLWUserLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:loginIdentifier];
        
        if (cell == nil) {
            
            cell = [YLWUserLoginCell userLoginCell];
            
        }
        cell.itemModel = itemModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:loginIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loginIdentifier];
        }
        
        
        cell.textLabel.text = itemModel.name;
        if (itemModel.swich) {
            cell.accessoryView = [[UISwitch alloc]init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        return cell;
    
    
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 65;
    }else{
    
        return 44;
    }

}

#pragma mark - 选中cell进行跳转

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    YLWUserGroupModel *group = self.dataArray[indexPath.section];
    YLWUserItemModel *itemModel = group.itemModelArray[indexPath.row];
    if (indexPath.section == 0) {
        
        if (self.isLogin) {
            YLWUserInfoViewController *userInfo = [[YLWUserInfoViewController alloc]init];
            userInfo.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:userInfo animated:YES];
        }else{
        
            YLWUserLoginController *login = [[YLWUserLoginController alloc]init];
            
            [self.navigationController pushViewController:login animated:YES];
            
        }
    
    }else if (indexPath.section == 1){
    
        if ([YLWUserLoginModel sharedUserLoginModel].isLogin) {
            
            YLWContentTableViewController *contentTable = [[YLWContentTableViewController alloc]init];
            
            contentTable.urlstring = itemModel.urlstring;
            
            contentTable.title = itemModel.name;
            
            [self.navigationController pushViewController:contentTable animated:YES];
            
        }else{
        
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请登录后查看！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
        
        }
        
    
    
    }


}

@end
