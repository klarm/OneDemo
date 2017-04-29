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
        
        self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
        self.iconImageView.layer.cornerRadius = 12;
        self.iconImageView.layer.masksToBounds = YES;
        self.iconImageView.layer.borderWidth = 1;
        self.iconImageView.layer.borderColor = [UIColor colorWithRed:211 / 255.0 green:211 / 255.0 blue:211 / 255.0 alpha:1].CGColor;
        [self.contentView addSubview:self.iconImageView];
        
        self.time = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.time];

        self.house = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.house];

        self.name = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.name];

        self.timing = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:self.timing];
    }
    return self;
}

-(void)setSiteItemModel:(YLWSiteItemModel *)siteItemModel{

    _siteItemModel = siteItemModel;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:siteItemModel.image] placeholderImage:[UIImage imageNamed:@"abs_pic"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
    self.time.text = siteItemModel.time;
    self.house.text = siteItemModel.house;
    self.name.text = siteItemModel.name;
    self.timing.text = siteItemModel.timing;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
