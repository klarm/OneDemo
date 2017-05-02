//
//  YLWSiteItemTableViewCell.m
//  推库iOS
//
//  Created by Mac on 16/2/19.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWSiteItemTableViewCell.h"
#import "YLWSiteItemModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface YLWSiteItemTableViewCell ()

@property (strong, nonatomic)  UIImageView *iconImageView;
@property (strong, nonatomic)  UILabel *time;
@property (strong, nonatomic)  UILabel *house;
@property (strong, nonatomic)  UILabel *name;
@property (strong, nonatomic)  UILabel *timing;
@end

@implementation YLWSiteItemTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
        self.iconImageView.layer.cornerRadius = 16;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderWidth = 1;
        self.iconImageView.layer.borderColor = [UIColor colorWithRed:211 / 255.0 green:211 / 255.0 blue:211 / 255.0 alpha:1].CGColor;
        [self.contentView addSubview:self.iconImageView];
        
        self.time = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.time];
        self.time.textAlignment = NSTextAlignmentCenter;

        self.house = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.house];
        self.house.textAlignment = NSTextAlignmentCenter;

        self.name = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.name];
        self.name.textAlignment = NSTextAlignmentCenter;

        self.timing = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.timing];
        self.timing.textAlignment = NSTextAlignmentCenter;
        
        self.contentView.backgroundColor = [UIColor colorWithRed:242/255.0  green:242/255.0  blue:242/255.0  alpha:0.9];
    }
    return self;
}

-(void)setSiteItemModel:(YLWSiteItemModel *)siteItemModel{

    _siteItemModel = siteItemModel;
    
//    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:siteItemModel.image] placeholderImage:[UIImage imageNamed:@"abs_pic"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//    }];
    
    self.iconImageView.image = [UIImage imageNamed:@"avatar1.png"];
    
    self.time.text = siteItemModel.time;
    self.house.text = siteItemModel.house;
    self.name.text = siteItemModel.name;
    self.timing.text = siteItemModel.timing;
}

- (void)layoutSubviews
{
    [self.iconImageView setX:10];
    [self.iconImageView setCenterY:self.height/2.0];
    
    CGFloat perwidht = (self.width - self.iconImageView.right - 40)/4;
    
    [self.time sizeToFit];
    [self.time setWidth:perwidht];
    [self.time setX:self.iconImageView.right+10];
    [self.time setCenterY:self.height/2.0];
    
    [self.house sizeToFit];
    [self.house setWidth:perwidht];
    [self.house setX:self.time.right+10];
    [self.house setCenterY:self.height/2.0];
    
    [self.name sizeToFit];
    [self.name setWidth:perwidht];
    [self.name setX:self.house.right+10];
    [self.name setCenterY:self.height/2.0];
    
    [self.timing sizeToFit];
    [self.timing setWidth:perwidht];
    [self.timing setX:self.name.right+10];
    [self.timing setCenterY:self.height/2.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
