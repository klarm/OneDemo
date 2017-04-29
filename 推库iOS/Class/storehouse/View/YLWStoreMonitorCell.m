//
//  YLWNewsTableViewCell.m
//  推库iOS
//
//  Created by Mac on 16/2/18.
//  Copyright © 2016年 YLW. All rights reserved.
//

#import "YLWStoreMonitorCell.h"
#import "YLWArticleModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface YLWStoreMonitorCell0()

@property (strong, nonatomic)  UILabel *ID;
@property (strong, nonatomic)  UILabel *Type;
@property (strong, nonatomic)  UILabel *temHight;
@property (strong, nonatomic)  UILabel *temAvg;
@property (strong, nonatomic)  UILabel *status;

@end

@implementation YLWStoreMonitorCell0

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _ID = [[UILabel alloc]initWithFrame:CGRectZero];
        _Type = [[UILabel alloc]initWithFrame:CGRectZero];
        _temHight = [[UILabel alloc]initWithFrame:CGRectZero];
        _temAvg = [[UILabel alloc]initWithFrame:CGRectZero];
        _status = [[UILabel alloc]initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_ID];
        [self.contentView addSubview:_Type];
        [self.contentView addSubview:_temHight];
        [self.contentView addSubview:_temAvg];
        [self.contentView addSubview:_status];
    }

    return self;
}

-(void)layoutSubviews
{
    
}

@end

@interface YLWStoreMonitorCell1()

@property (strong, nonatomic)  UILabel *ID;
@property (strong, nonatomic)  UILabel *Type;
@property (strong, nonatomic)  UILabel *temHight;
@property (strong, nonatomic)  UILabel *temAvg;
@property (strong, nonatomic)  UILabel *status;

@end

@implementation YLWStoreMonitorCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _ID = [[UILabel alloc]initWithFrame:CGRectZero];
        _Type = [[UILabel alloc]initWithFrame:CGRectZero];
        _temHight = [[UILabel alloc]initWithFrame:CGRectZero];
        _temAvg = [[UILabel alloc]initWithFrame:CGRectZero];
        _status = [[UILabel alloc]initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_ID];
        [self.contentView addSubview:_Type];
        [self.contentView addSubview:_temHight];
        [self.contentView addSubview:_temAvg];
        [self.contentView addSubview:_status];
    }
    
    return self;
}

-(void)layoutSubviews
{
    
}

@end

@interface YLWStoreMonitorSearchCell()

@end

@implementation YLWStoreMonitorSearchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {   
    }
    
    return self;
}

-(void)layoutSubviews
{
    
}

@end
