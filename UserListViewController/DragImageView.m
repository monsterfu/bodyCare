//
//  DragImageView.m
//  CircleProject
//
//  Created by zbq on 13-10-30.
//  Copyright (c) 2013年 zbq. All rights reserved.
//

#import "DragImageView.h"

@implementation DragImageView

@synthesize current_radian;
@synthesize current_animation_radian;
@synthesize animation_radian;
@synthesize radian;
@synthesize view_point;

#define HEADICON_GAP  (10)


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _bgImageView = [[UIImageView alloc]initWithFrame:self.frame];
        [self addSubview:_bgImageView];
        _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(HEADICON_GAP, HEADICON_GAP, self.frame.size.width-HEADICON_GAP*2 , self.frame.size.height-HEADICON_GAP*2)];
        [self addSubview:_headImage];
        [_headImage.layer setCornerRadius:CGRectGetHeight([_headImage bounds])/2];
        _headImage.layer.masksToBounds = YES;
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, self.frame.size.width, 40)];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLabel];
        
        _tapGestureRecogizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Tap)];
        [self addGestureRecognizer:_tapGestureRecogizer];
        
        _longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap)];
        [self addGestureRecognizer:_longPressGestureRecognizer];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)setPerson:(PersonDetailInfo *)person
{
    _person = person;
    [_headImage setImage:_person.image];
    [_nameLabel setText:_person.name];
}
-(void)Tap
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(DragImageViewLongTap:)]) {
        [self.delegate DragImageViewLongTap:_person];
    }
}
-(void)longTap
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(DragImageViewLongTap:)]) {
        [self.delegate DragImageViewLongTap:_person];
    }
}
@end
