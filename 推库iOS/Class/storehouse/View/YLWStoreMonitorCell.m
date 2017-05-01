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
@property (strong, nonatomic)  UIView *subContentView;

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
        
        _ID.textAlignment = NSTextAlignmentCenter;
        _Type.textAlignment = NSTextAlignmentCenter;
        _temHight.textAlignment = NSTextAlignmentCenter;
        _temAvg.textAlignment = NSTextAlignmentCenter;
        _status.textAlignment = NSTextAlignmentCenter;
        
        _subContentView = [[UIView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_subContentView];
        
        [self.subContentView addSubview:_ID];
        [self.subContentView addSubview:_Type];
        [self.subContentView addSubview:_temHight];
        [self.subContentView addSubview:_temAvg];
        [self.subContentView addSubview:_status];
        
        _subContentView.backgroundColor = [UIColor lightGrayColor];
        _subContentView.clipsToBounds = YES;
        
        _ID.backgroundColor = [UIColor orangeColor];
        _ID.textColor = [UIColor whiteColor];
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
    [_subContentView setFrame:CGRectMake(0, 2, self.width, self.height-4)];
    
    CGFloat perw = (self.width - 40) / 5.0;
    CGFloat perh = self.height;

    
    [_ID sizeToFit];
    [_Type sizeToFit];
    [_temHight sizeToFit];
    [_temAvg sizeToFit];
    [_status sizeToFit];
    
    [_ID setWidth:perw];
    [_ID setHeight:perh];
    
    [_Type setWidth:perw];
    [_Type setHeight:perh];

    [_temHight setWidth:perw];
    [_temHight setHeight:perh];

    [_temAvg setWidth:perw];
    [_temAvg setHeight:perh];

    [_status setWidth:perw];
    [_status setHeight:perh];

    [_ID setX:0];
    [_Type setX:_ID.right+10];
    [_temHight setX:_Type.right+10];
    [_temAvg setX:_temHight.right+10];
    [_status setX:_temAvg.right+10];
    
    _ID.centerY = self.subContentView.frame.size.height / 2.0;
    _Type.centerY = _ID.centerY;
    _temHight.centerY = _ID.centerY;
    _temAvg.centerY = _ID.centerY;
    _status.centerY = _ID.centerY;
}

@end

@interface YLWStoreMonitorCell1()
@property (strong, nonatomic)  UIView  *subContentView;
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
        
        _ID.textAlignment = NSTextAlignmentCenter;
        _Type.textAlignment = NSTextAlignmentCenter;
        _startTime.textAlignment = NSTextAlignmentCenter;
        _endTime.textAlignment = NSTextAlignmentCenter;
        _status.textAlignment = NSTextAlignmentCenter;
        
        _subContentView = [[UIView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_subContentView];
        
        [self.subContentView addSubview:_ID];
        [self.subContentView addSubview:_Type];
        [self.subContentView addSubview:_startTime];
        [self.subContentView addSubview:_endTime];
        [self.subContentView addSubview:_status];
        
        _subContentView.backgroundColor = [UIColor lightGrayColor];
        _subContentView.clipsToBounds = YES;
        
        _ID.backgroundColor = [UIColor orangeColor];
        _ID.textColor = [UIColor whiteColor];
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
    [_subContentView setFrame:CGRectMake(0, 2, self.width, self.height-4)];

    [_ID sizeToFit];
    [_Type sizeToFit];
    [_startTime sizeToFit];
    [_endTime sizeToFit];
    [_status sizeToFit];
    
    CGFloat perw = (self.width - 40) / 5.0;
    CGFloat perh = self.height;
    
    
    [_ID sizeToFit];
    [_Type sizeToFit];
    [_startTime sizeToFit];
    [_endTime sizeToFit];
    [_status sizeToFit];
    
    [_ID setWidth:perw];
    [_ID setHeight:perh];
    
    [_Type setWidth:perw];
    [_Type setHeight:perh];
    
    [_startTime setWidth:perw];
    [_startTime setHeight:perh];
    
    [_endTime setWidth:perw];
    [_endTime setHeight:perh];
    
    [_status setWidth:perw];
    [_status setHeight:perh];
    
    [_ID setX:0];
    [_Type setX:_ID.right+10];
    [_startTime setX:_Type.right+10];
    [_endTime setX:_startTime.right+10];
    [_status setX:_endTime.right+10];
    
    _ID.centerY = self.subContentView.frame.size.height / 2.0;
    _Type.centerY = _ID.centerY;
    _startTime.centerY = _ID.centerY;
    _endTime.centerY = _ID.centerY;
    _status.centerY = _ID.centerY;
}

@end

@interface YLWStoreMonitorSearchCell()

@property (strong, nonatomic)  UIView *search;


@end

@implementation YLWStoreMonitorSearchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UISearchBar *search = [[UISearchBar alloc]init];
        search.placeholder = @"请输入搜索内容";
        
        //search.barTintColor = [UIColor whiteColor] ;
        
        self.search = search;

        
        self.search.backgroundColor = [UIColor whiteColor];
        
        
        [self.contentView addSubview:search];
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    [self.search setFrame:self.bounds];
    
    [self.search setFrame:CGRectMake(30, 5, self.width-60, self.height-10)];
}

@end
