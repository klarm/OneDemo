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

- (void)setCellData:(NSDictionary*)dic
{
    NSString* ID = [dic objectForKey:@"id"];
    NSString* type = [dic objectForKey:@"type"];
    NSString* tempHigh = [dic objectForKey:@"temHight"];
    NSString* tempAvg = [dic objectForKey:@"temAvg"];
    NSString* status = [dic objectForKey:@"status"];

    _ID.text = ID;
    _Type.text = type;
    _temHight.text = tempHigh;
    _temAvg.text = tempAvg;
    _status.text = status;
}

-(void)layoutSubviews
{
    [_ID sizeToFit];
    [_Type sizeToFit];
    [_temHight sizeToFit];
    [_temAvg sizeToFit];
    [_status sizeToFit];
    
    [_ID setX:0];
    [_Type setX:_ID.right+10];
    [_temHight setX:_Type.right+10];
    [_temAvg setX:_temHight.right+10];
    [_status setX:_temAvg.right+10];
}

@end

@interface YLWStoreMonitorCell1()

@property (strong, nonatomic)  UILabel *ID;
@property (strong, nonatomic)  UILabel *Type;
@property (strong, nonatomic)  UILabel *startTime;
@property (strong, nonatomic)  UILabel *endTime;
@property (strong, nonatomic)  UILabel *status;

@end

@implementation YLWStoreMonitorCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _ID = [[UILabel alloc]initWithFrame:CGRectZero];
        _Type = [[UILabel alloc]initWithFrame:CGRectZero];
        _startTime = [[UILabel alloc]initWithFrame:CGRectZero];
        _endTime = [[UILabel alloc]initWithFrame:CGRectZero];
        _status = [[UILabel alloc]initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_ID];
        [self.contentView addSubview:_Type];
        [self.contentView addSubview:_startTime];
        [self.contentView addSubview:_endTime];
        [self.contentView addSubview:_status];
    }
    
    return self;
}

- (void)setCellData:(NSDictionary*)dic
{
    NSString* ID = [dic objectForKey:@"id"];
    NSString* type = [dic objectForKey:@"type"];
    NSString* startTime = [dic objectForKey:@"startTime"];
    NSString* endTime = [dic objectForKey:@"endTime"];
    NSString* status = [dic objectForKey:@"status"];
    
    _ID.text = ID;
    _Type.text = type;
    _startTime.text = startTime;
    _endTime.text = endTime;
    _status.text = status;

}

-(void)layoutSubviews
{
    [_ID sizeToFit];
    [_Type sizeToFit];
    [_startTime sizeToFit];
    [_endTime sizeToFit];
    [_status sizeToFit];
    
    [_ID setX:0];
    [_Type setX:_ID.right+10];
    [_startTime setX:_Type.right+10];
    [_endTime setX:_startTime.right+10];
    [_status setX:_endTime.right+10];
}

@end

@interface YLWStoreMonitorSearchCell()

@property (strong, nonatomic)  UIView *search;


@end

@implementation YLWStoreMonitorSearchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UISearchBar *search = [[UISearchBar alloc]init];
        search.placeholder = @"请输入搜索";
        
        self.search = search;
        
        [self.contentView addSubview:search];
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    [self.search setFrame:self.bounds];
}

@end
