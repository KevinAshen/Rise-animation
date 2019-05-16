//
//  ViewController.m
//  Rise-animation-Demo
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "ViewController.h"
#import "BounceView.h"

#define k_screen_width          [UIScreen mainScreen].bounds.size.width
#define k_screen_height         [UIScreen mainScreen].bounds.size.height
#define kBounceViewHeight k_screen_height / 3.5

@interface ViewController ()

@property (nonatomic, strong) BounceView *bounceView;
@property (nonatomic, strong) UIButton *touchButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.touchButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 50, 50)];
    [self.view addSubview:_touchButton];
    
    [_touchButton setTitle:@"TOUCH ME" forState:UIControlStateNormal];
    [_touchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_touchButton addTarget:self action:@selector(touchMe) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)touchMe {
    self.bounceView = [[BounceView alloc] initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height)];
    [_bounceView showInView:self.view];
}

@end
