//
//  BounceView.m
//  Rise-animation-Demo
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BounceView.h"
#import "ChooseButton.h"
#define k_screen_width          [UIScreen mainScreen].bounds.size.width
#define k_screen_height         [UIScreen mainScreen].bounds.size.height
#define kBounceViewHeight k_screen_height / 3.5

@interface BounceView ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *testImageView;

///添加蔬菜
@property (nonatomic, strong) ChooseButton *vegButton;
///添加水果
@property (nonatomic, strong) ChooseButton *fruitButton;
///添加菜肴
@property (nonatomic, strong) ChooseButton *cookButton;
///添加主食
@property (nonatomic, strong) ChooseButton *stapleButton;

@end

@implementation BounceView

- (void)setupContent {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, k_screen_height - kBounceViewHeight, k_screen_width, kBounceViewHeight)];
        _contentView.backgroundColor = [UIColor colorWithRed:0.91f green:0.91f blue:0.91f alpha:1.00f];
        [self addSubview:_contentView];
        
        [self setupContentSubview];
    }
}

- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    [self setupContent];
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBounceViewHeight)];
    
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 1.0;
        
        [self.contentView setFrame:CGRectMake(0, k_screen_height - kBounceViewHeight, k_screen_width, kBounceViewHeight)];
    } completion:nil];
}

- (void)setupContentSubview {
    self.vegButton = [[ChooseButton alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [_contentView addSubview:_vegButton];
    
    _vegButton.buttonStyle = imageTop;
    _vegButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_vegButton setTitle:@"蔬菜" forState:UIControlStateNormal];
    [_vegButton setBackgroundColor:[UIColor lightGrayColor]];
    [_vegButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_vegButton setImage:[UIImage imageNamed:@"bcl_btn_whole.png"] forState:UIControlStateNormal];
    [_vegButton setBackgroundColor:[UIColor clearColor]];
    
    _contentView.backgroundColor = [UIColor yellowColor];
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation.duration = 1.0f; //动画时间
    moveAnimation.fromValue = @(self.vegButton.center.y + 90);
    moveAnimation.toValue = @(self.vegButton.center.y);
    //一个时间函数，代表它是怎么运行的
    moveAnimation.speed = 2.0;
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    moveAnimation.repeatCount = HUGE_VALF;
    moveAnimation.repeatDuration = 1;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.fillMode = kCAFillModeForwards;
    //添加动画，后面可以拿到中国动画的标志
    [self.vegButton.layer addAnimation:moveAnimation forKey:@"可以拿到中国动画的标志值"];
}

- (void)disMissView {
    [_contentView setFrame:CGRectMake(0, k_screen_height - kBounceViewHeight, k_screen_width, kBounceViewHeight)];
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 0.0;
        
        [self.contentView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBounceViewHeight)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.contentView removeFromSuperview];
    }];
}

@end
