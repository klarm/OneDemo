//
//  YLWUserLoginController.m
//  推库iOS
//
//  Created by Mac on 16/2/21.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWStoreMapController.h"
#import "YLWTabBarController.h"
#import <Masonry.h>

@interface YLWStoreMapController ()
@property (strong, nonatomic)  UIImageView *bk;

@property (nonatomic,strong) UIView *errorLoginView;
@property (nonatomic,strong) UILabel *errorTextLabel;

@end

@implementation YLWStoreMapController


-(instancetype)init{

    if (self = [super init]) {
        _bk = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_bk];

        

        _bk.userInteractionEnabled = YES;
        [_bk addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mylogin)]];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bk.contentMode =UIViewContentModeScaleToFill;
    id d = [UIImage imageNamed:@"storemap.jpg"];
    self.bk.image = d;
    
    return self;

}

-(void)mylogin{
        YLWTabBarController *tabbarVC = [[YLWTabBarController alloc]init];
    [self presentViewController:tabbarVC animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
