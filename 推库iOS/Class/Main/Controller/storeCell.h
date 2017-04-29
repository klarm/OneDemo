/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
Custom collection view cell for image and its label.
*/

@import UIKit;

@interface storeCell : UICollectionViewCell
@property(nonatomic ,strong)UIImageView *imgView;
@property(nonatomic ,strong)UILabel *title;
@property(nonatomic ,strong)UILabel *subTitle;

-(void)setCellData:(NSDictionary*)dic;


@end
