/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
Custom collection view cell for image and its label.
*/

#import "storeCell.h"

@implementation storeCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, CGRectGetWidth(self.frame)-10)];
        self.imgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.frame)-10, 20)];
        self.title.backgroundColor = [UIColor brownColor];
        self.title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.title];
        
        self.subTitle = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.title.frame), CGRectGetWidth(self.frame)-10, 20)];
        self.subTitle.backgroundColor = [UIColor brownColor];
        self.subTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.subTitle];
    }
    return self;
}

-(void)setCellData:(NSDictionary*)dic
{
    
}

@end
