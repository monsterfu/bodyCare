//
//  DragImageView.h
//  CircleProject
//
//  Created by zbq on 13-10-30.
//  Copyright (c) 2013年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalHeader.h"

@protocol DragImageViewDelegate <NSObject>
-(void)DragImageViewLongTap:(PersonDetailInfo*)person;
@end


@interface DragImageView : UIView
{
    UIImageView* _headImage;
    UILabel* _nameLabel;
    UITapGestureRecognizer* _tapGestureRecogizer;
    UILongPressGestureRecognizer* _longPressGestureRecognizer;
}

//与y轴实时角度（逆时针方向），用于在拖动时候确定DragImageView的中心
@property(nonatomic) CGFloat current_radian;

@property(nonatomic) UIImageView* bgImageView;

//记录该位置初始的角度（与y轴）
@property(nonatomic) CGFloat radian;

//与x轴实时角度 用于DragImageView拖动停止后的旋转
@property(nonatomic) CGFloat current_animation_radian;

//记录该位置初始角度（与x轴）
@property(nonatomic) CGFloat animation_radian;

//DragImageView的中心
@property(nonatomic) CGPoint view_point;

@property(nonatomic, retain)PersonDetailInfo*  person;
@property(nonatomic, assign)id<DragImageViewDelegate>delegate;

@end
