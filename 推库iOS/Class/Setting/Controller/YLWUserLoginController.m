//
//  YLWUserLoginController.m
//  推库iOS
//
//  Created by Mac on 16/2/21.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWUserLoginController.h"
#import <Masonry.h>
@interface YLWUserLoginController ()

@property (strong, nonatomic)  UITextField *emailTextField;
@property (strong, nonatomic)  UITextField *passWordTextField;
@property (strong, nonatomic)  UIButton *login;
@property (strong, nonatomic)  UIImageView *bk;

@property (nonatomic,strong) UIView *errorLoginView;
@property (nonatomic,strong) UILabel *errorTextLabel;

@end

@implementation YLWUserLoginController

#pragma mark - 懒加载
#pragma mark 懒加载登录错误的提示试图
-(UILabel *)errorTextLabel{

    if (_errorTextLabel == nil) {
        _errorTextLabel = [[UILabel alloc]init];
        [self.errorLoginView addSubview:self.errorTextLabel];
        _errorTextLabel.textAlignment = NSTextAlignmentCenter;
        _errorTextLabel.textColor = [UIColor whiteColor];
        _errorTextLabel.font = [UIFont systemFontOfSize:15];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"登录失败";
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.errorLoginView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.errorLoginView.mas_top).with.offset(20);
            make.centerX.equalTo(self.errorLoginView.mas_centerX);
            
        }];
        [self.errorTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.errorLoginView.mas_centerX);
            make.top.equalTo(label.mas_bottom).with.offset(10);
            make.right.left.equalTo(self.errorLoginView);
        }];
        
    }

    return _errorTextLabel;
    
}

-(UIView *)errorLoginView{

    if (_errorLoginView == nil) {
        _errorLoginView = [[UIView alloc]init];
//        _errorLoginView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:151 / 255.0 blue:40 / 255.0 alpha:1];
//        
//        [self.navigationController.view addSubview:_errorLoginView];
//        
//        [_errorLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            self.topConstraint =  make.top.equalTo(self.navigationController.view.mas_top).with.offset(-95);
//            make.right.left.equalTo(self.navigationController.view);
//            make.height.mas_equalTo(95);
//            
//        }];
        
    }
    return _errorLoginView;
}


-(instancetype)init{

    if (self = [super init]) {
        _bk = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_bk];

        
        _emailTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 200, 200, 40)];
        _emailTextField.backgroundColor = [UIColor whiteColor];
        _emailTextField.placeholder = @"用户名：";
        
        _passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, _emailTextField.bottom+20, 200, 40)];
        _passWordTextField.backgroundColor = [UIColor whiteColor];
         _passWordTextField.placeholder = @"密码：";

        [_emailTextField setCenterX:self.view.width/2.0];
        [_passWordTextField setCenterX:self.view.width/2.0];
        
        [self.view addSubview:_emailTextField];
        [self.view addSubview:_passWordTextField];
        
        
        _login = [[UIButton alloc]initWithFrame:CGRectMake(_emailTextField.x, _passWordTextField.bottom+20, 200, 40)];
        _login.backgroundColor = [UIColor whiteColor];
        [_login setTitle:@"登录" forState:UIControlStateNormal];
        [_login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:_login];

    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.bk.contentMode =UIViewContentModeScaleToFill;
    id d = [UIImage imageNamed:@"splash.jpg"];
    self.bk.image = d;
    
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    self.errorTextLabel.text = @"";
    
}

/**
 *  使view变圆
 *
 *  @param originalView 需要变圆的view
 */
-(void)makeCircleWithview:(UIView *)originalView{

    originalView.layer.cornerRadius = 35;
    originalView.layer.masksToBounds = YES;
    originalView.layer.borderWidth = 1;
    originalView.layer.borderColor = [UIColor grayColor].CGColor;
    
    

}


#pragma mark - 设置导航栏
-(void)setNav{

    self.title = @"登录";
    UIBarButtonItem *registItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registItemClick)];
    self.navigationItem.rightBarButtonItem = registItem;
    

}

-(void)registItemClick{

    NSLog(@"注册");

}

#pragma mark - 点击登录
- (IBAction)loginBtnClick {
    
    NSDictionary *nameAndPassWord = @{
                                      @"email":self.emailTextField.text,
                                      @"password":self.passWordTextField.text
                                      };
    
    [[YLWUserLoginModel sharedUserLoginModel] getUserInfoWith:nameAndPassWord success:^(NSString *resultString) {
        
        if ([resultString isEqualToString:@"success"]) {
            
            [super.tabBarController setSelectedIndex:0];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"YLWUserLoginControllerLoginSuccess" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
            
            
            
        }else{
        
            
            self.errorTextLabel.text = resultString;
            
            //[self.topConstraint uninstall];
            
            [self.errorLoginView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                //self.topConstraint = make.top.equalTo(self.navigationController.view.mas_top);
                
            }];
            
            [UIView animateWithDuration:1.0 animations:^{
                
                [self.navigationController.view layoutIfNeeded];
                
                
                
            } completion:^(BOOL finished) {
//                [self.errorLoginView removeFromSuperview];
                //[self.topConstraint uninstall];
                [self.errorLoginView mas_updateConstraints:^(MASConstraintMaker *make) {
                    
                    //self.topConstraint = make.top.equalTo(self.navigationController.view.mas_top).with.offset(-95);
                    
                }];
                
                [self.navigationController.view layoutIfNeeded];

            }];
        
        }
        

    } error:^(NSError *error) {
         NSLog(@"%@",error);
        
    }];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
