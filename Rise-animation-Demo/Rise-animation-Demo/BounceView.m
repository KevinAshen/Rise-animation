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
    
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1.0;
        
        [self.contentView setFrame:CGRectMake(0, k_screen_height - kBounceViewHeight, k_screen_width, kBounceViewHeight)];
    } completion:nil];
}

- (void)setupContentSubview {
    self.vegButton = [[ChooseButton alloc] initWithFrame:CGRectMake(0, 50, 100, 100)];
    [_contentView addSubview:_vegButton];
    
    self.fruitButton = [[ChooseButton alloc] initWithFrame:CGRectMake(100, 50, 100, 100)];
    [_contentView addSubview:_fruitButton];
    
    self.cookButton = [[ChooseButton alloc] initWithFrame:CGRectMake(200, 50, 100, 100)];
    [_contentView addSubview:_cookButton];
    
    self.stapleButton = [[ChooseButton alloc] initWithFrame:CGRectMake(300, 50, 100, 100)];
    [_contentView addSubview:_stapleButton];
    
    _contentView.backgroundColor = [UIColor yellowColor];
    
    CABasicAnimation *moveAnimation1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation1.duration = 1; //动画时间
    moveAnimation1.beginTime = CACurrentMediaTime() - 0.3;
    moveAnimation1.fromValue = @(self.vegButton.center.y + 70);
    moveAnimation1.toValue = @(self.vegButton.center.y);
    moveAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    moveAnimation1.repeatCount = HUGE_VALF;
    moveAnimation1.repeatDuration = 1;
    moveAnimation1.removedOnCompletion = NO;
    moveAnimation1.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *moveAnimation2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation2.duration = 1; //动画时间
    moveAnimation2.beginTime = CACurrentMediaTime() - 0.2;
    moveAnimation2.fromValue = @(self.vegButton.center.y + 70);
    moveAnimation2.toValue = @(self.vegButton.center.y);
    moveAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    moveAnimation2.repeatCount = HUGE_VALF;
    moveAnimation2.repeatDuration = 1;
    moveAnimation2.removedOnCompletion = NO;
    moveAnimation2.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *moveAnimation3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation3.duration = 1; //动画时间
    moveAnimation3.beginTime = CACurrentMediaTime() - 0.1;
    moveAnimation3.fromValue = @(self.vegButton.center.y + 70);
    moveAnimation3.toValue = @(self.vegButton.center.y);
    moveAnimation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    moveAnimation3.repeatCount = HUGE_VALF;
    moveAnimation3.repeatDuration = 1;
    moveAnimation3.removedOnCompletion = NO;
    moveAnimation3.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *moveAnimation4 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation4.duration = 1; //动画时间
    moveAnimation4.fromValue = @(self.vegButton.center.y + 70);
    moveAnimation4.toValue = @(self.vegButton.center.y);
    moveAnimation4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    moveAnimation4.repeatCount = HUGE_VALF;
    moveAnimation4.repeatDuration = 1;
    moveAnimation4.removedOnCompletion = NO;
    moveAnimation4.fillMode = kCAFillModeForwards;
    
    //添加动画，后面可以拿到中国动画的标志
    [self.vegButton.layer addAnimation:moveAnimation1 forKey:@"可以拿到中国动画的标志值1"];
    [self.fruitButton.layer addAnimation:moveAnimation2 forKey:@"可以拿到中国动画的标志值2"];
    [self.cookButton.layer addAnimation:moveAnimation3 forKey:@"可以拿到中国动画的标志值3"];
    [self.stapleButton.layer addAnimation:moveAnimation4 forKey:@"可以拿到中国动画的标志值4"];
}

- (void)disMissView {
    [_contentView setFrame:CGRectMake(0, k_screen_height - kBounceViewHeight, k_screen_width, kBounceViewHeight)];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0;
        
        [self.contentView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBounceViewHeight)];
        CABasicAnimation *moveAnimation1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
        moveAnimation1.duration = 1; //动画时间
        moveAnimation1.beginTime = CACurrentMediaTime() - 0.3;
        moveAnimation1.fromValue = @(self.vegButton.center.y);
        moveAnimation1.toValue = @(self.vegButton.center.y + 70);
        moveAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        moveAnimation1.repeatCount = HUGE_VALF;
        moveAnimation1.repeatDuration = 1;
        moveAnimation1.removedOnCompletion = NO;
        moveAnimation1.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *moveAnimation2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
        moveAnimation2.duration = 1; //动画时间
        moveAnimation2.beginTime = CACurrentMediaTime() - 0.2;
        moveAnimation2.fromValue = @(self.vegButton.center.y);
        moveAnimation2.toValue = @(self.vegButton.center.y + 70);
        moveAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        moveAnimation2.repeatCount = HUGE_VALF;
        moveAnimation2.repeatDuration = 1;
        moveAnimation2.removedOnCompletion = NO;
        moveAnimation2.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *moveAnimation3 = [CABasicAnimation animationWithKeyPath:@"position.y"];
        moveAnimation3.duration = 1; //动画时间
        moveAnimation3.beginTime = CACurrentMediaTime() - 0.1;
        moveAnimation3.fromValue = @(self.vegButton.center.y);
        moveAnimation3.toValue = @(self.vegButton.center.y + 70);
        moveAnimation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        moveAnimation3.repeatCount = HUGE_VALF;
        moveAnimation3.repeatDuration = 1;
        moveAnimation3.removedOnCompletion = NO;
        moveAnimation3.fillMode = kCAFillModeForwards;
        
        CABasicAnimation *moveAnimation4 = [CABasicAnimation animationWithKeyPath:@"position.y"];
        moveAnimation4.duration = 1; //动画时间
        moveAnimation4.fromValue = @(self.vegButton.center.y);
        moveAnimation4.toValue = @(self.vegButton.center.y + 70);
        moveAnimation4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        moveAnimation4.repeatCount = HUGE_VALF;
        moveAnimation4.repeatDuration = 1;
        moveAnimation4.removedOnCompletion = NO;
        moveAnimation4.fillMode = kCAFillModeForwards;
        
        //添加动画，后面可以拿到中国动画的标志
        [self.vegButton.layer addAnimation:moveAnimation4 forKey:@"可以拿到中国动画的标志值5"];
        [self.fruitButton.layer addAnimation:moveAnimation3 forKey:@"可以拿到中国动画的标志值6"];
        [self.cookButton.layer addAnimation:moveAnimation2 forKey:@"可以拿到中国动画的标志值7"];
        [self.stapleButton.layer addAnimation:moveAnimation1 forKey:@"可以拿到中国动画的标志值8"];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.contentView removeFromSuperview];
    }];
}

@end
