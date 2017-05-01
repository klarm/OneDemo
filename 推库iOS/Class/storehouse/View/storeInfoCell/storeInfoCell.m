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
@property (strong, nonatomic)  UILabel *ID;
@property (strong, nonatomic)  UILabel *Type;
@property (strong, nonatomic)  UILabel *temHight;
@property (strong, nonatomic)  UILabel *temAvg;
@property (strong, nonatomic)  UILabel *status;

@end

@implementation storeInfoCell

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
    
    self.backgroundColor = [UIColor redColor];

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

- (void)setCellImage:(UIImage*)img
{
    
}

@end
