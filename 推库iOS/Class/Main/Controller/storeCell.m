/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
Custom collection view cell for image and its label.
*/

#import "storeCell.h"

@implementation storeCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, 40, 40)];
        self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame)+5, CGRectGetWidth(self.frame)-10, 20)];
        self.title.backgroundColor = [UIColor brownColor];
        self.title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.title];
        
        self.subTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.title.frame)+5, CGRectGetWidth(self.frame)-10, 20)];
        self.subTitle.backgroundColor = [UIColor brownColor];
        self.subTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.subTitle];
    }
    
    return self;
}

-(void)setCellData:(NSDictionary*)dic
{
    NSString* title = [dic objectForKey:@"title"];
    NSString* subTitle = [dic objectForKey:@"subTitle"];

    self.imgView.image = [UIImage imageNamed:@"granary_circle.png"];
    self.title.text = title;
    self.subTitle.text = subTitle;
    
    [self setNeedsLayout];
}

-(void)layoutSubviews
{
    [self.imgView setFrame:CGRectMake((self.bounds.size.width-40)/2, 30, 40, 40)];
    
    [self.title sizeToFit];
    [self.subTitle sizeToFit];
    
    [self.title setCenterX:self.imgView.centerX];
    [self.subTitle setCenterX:self.imgView.centerX];
}

@end
