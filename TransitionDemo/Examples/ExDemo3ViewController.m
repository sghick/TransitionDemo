//
//  ExDemo3ViewController.m
//  TransitionDemo
//
//  Created by 丁治文 on 16/6/11.
//  Copyright © 2016年 sumrise.com. All rights reserved.
//

#import "ExDemo3ViewController.h"

@interface ExDemo3ViewController ()

@property (strong, nonatomic) UIButton *lastBtn;
@property (strong, nonatomic) UIButton *nextBtn;

@end

@implementation ExDemo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:self.lastBtn];
    [self.view addSubview:self.nextBtn];
}

- (void)lastBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)nextBtnAction:(UIButton *)sender {
    
}

- (UIButton *)lastBtn {
    if (_lastBtn == nil) {
        UIButton *lastBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        lastBtn.frame = CGRectMake((CGRectGetWidth([UIScreen mainScreen].bounds) - 60)/2, 120, 60, 60);
        [lastBtn setTitle:@"上一页" forState:UIControlStateNormal];
        lastBtn.backgroundColor = [UIColor greenColor];
        lastBtn.layer.cornerRadius = 30;
        [lastBtn addTarget:self action:@selector(lastBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _lastBtn = lastBtn;
    }
    return _lastBtn;
}

- (UIButton *)nextBtn {
    if (_nextBtn == nil) {
        UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        nextBtn.frame = CGRectMake((CGRectGetWidth([UIScreen mainScreen].bounds) - 60)/2, 200, 60, 60);
        [nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
        nextBtn.backgroundColor = [UIColor greenColor];
        nextBtn.layer.cornerRadius = 30;
        [nextBtn addTarget:self action:@selector(nextBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _nextBtn = nextBtn;
    }
    return _nextBtn;
}

@end
