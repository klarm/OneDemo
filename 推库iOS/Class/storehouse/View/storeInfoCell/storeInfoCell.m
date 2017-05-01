//
//  YLWNewsTableViewCell.m
//  推库iOS
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "storeInfoCell.h"
#import "YLWArticleModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface storeInfoCell()
@property(nonatomic, strong) UIView* bkView;
@end

@implementation storeInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.bkView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, self.frame.size.width, self.frame.size.height -10)];
        
        [self.contentView addSubview:self.bkView];
    }
    
    self.backgroundColor = [UIColor redColor];

    return self;
}

-(void)layoutSubviews{
    [self.bkView setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

- (void)setCellImage:(UIImage*)img
{
    self.bkView.contentMode= UIViewContentModeScaleToFill;
    self.bkView.layer.contents = (__bridge id _Nullable)(img.CGImage);
}

@end
