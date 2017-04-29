//
//  YLWTabBarController.m
//  推库iOS
//
//  Created by Mac on 16/2/17.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWTabBarController.h"
#import "YLWHomeViewController.h"
#import "YLWSiteViewController.h"
#import "YLWTopicViewController.h"
#import "YLWUserViewController.h"

@interface YLWTabBarController ()

@end

@implementation YLWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self addChildViewControllers];
}

-(void)addChildViewControllers{
    
    YLWSiteViewController *site = [[YLWSiteViewController alloc]init];
    [self addChildViewController:site WithTitle:@"主页" image:@"tab_site"];

    YLWHomeViewController *homeVc = [[YLWHomeViewController alloc]init];
    [self addChildViewController:homeVc WithTitle:@"监测" image:@"tab_home"];
        
    YLWTopicViewController *topic = [[YLWTopicViewController alloc]init];
    [self addChildViewController:topic WithTitle:@"人员考勤" image:@"tab_topic"];
    
    YLWUserViewController *user = [[YLWUserViewController alloc]init];
    [self addChildViewController:user WithTitle:@"设置" image:@"tab_user"];


}


-(void)addChildViewController:(UIViewController *)childController WithTitle:(NSString *)title image:(NSString *)imageName{
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    childController.title = title;
    
    
    YLWNavigationController *nav = [[YLWNavigationController alloc]initWithRootViewController:childController];
    
    
    [self addChildViewController:nav];

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
