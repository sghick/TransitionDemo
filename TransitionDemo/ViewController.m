//
//  ViewController.m
//  TransitionDemo
//
//  Created by 丁治文 on 16/6/11.
//  Copyright © 2016年 sumrise.com. All rights reserved.
//

#import "ViewController.h"
#import "ExDemo1ViewController.h"
#import "ExDemo2ViewController.h"
#import "ExDemo3ViewController.h"
#import "ExDemo4ViewController.h"
#import "WCTransitions.h"

static NSString *identifier = @"identifier";

@interface ViewController () <
    UITableViewDataSource,
    UITableViewDelegate >

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;

@property (strong, nonatomic) WCTransitioningDelegate *transDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.dataSource = @[@"demo1", @"demo2", @"demo3", @"demo4"];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            [self presentDemoVC1];
        }
            break;
        case 1: {
            [self presentDemoVC2];
        }
            break;
        case 2: {
            [self presentDemoVC3];
        }
            break;
        case 3: {
            [self presentDemoVC4];
        }
            break;
            
        default:
            break;
    }
}

- (void)presentDemoVC1 {
    // 说明：给tableView包装一个导航控制器（注意modal谁就设置谁的现实样式）
    ExDemo1ViewController *vc = [[ExDemo1ViewController alloc] init];
    vc.title = @"demo1";
    /**
     *  呈现样式:Modal出来的控制器，最终显示出来的样子
     */
    // 全屏显示（默认）
//    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    // 宽度：竖屏时的宽度（768）  高度：当前屏幕的高度（填充整个高度）
//    vc.modalPresentationStyle = UIModalPresentationPageSheet;
    // 占据屏幕中间的一小块（比较常用）
//    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    // 跟随父控制器的呈现样式
    vc.modalPresentationStyle = UIModalPresentationCurrentContext;
    // 自定义 >= ios7
//    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    /**
     *  过渡样式:Modal出来的控制器，是以怎样的动画呈现出来
     */
    // （默认）
//    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    // 三维翻转
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    // 淡入淡出
//    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    // 翻页（只显示部分，使用前提：呈现样式必须是UIModalPresentationFullScreen）
//    vc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)presentDemoVC2 {
    self.transDelegate = [WCTransitionManager transitionForTransDelegate2];
    ExDemo2ViewController *vc = [[ExDemo2ViewController alloc] init];
    vc.title = @"demo2";
    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    __weak typeof(self) weakSelf = self;
    [self.transDelegate setFromViewController:self toViewController:vc];
    [self.transDelegate setPanGestureWithInteractiveType:WCInteractiveTransitionTypePresent direction:WCInteractiveTransitionGestureDirectionLeft gestureConifg:^{
        [weakSelf presentViewController:vc animated:YES completion:nil];
    }];
    [self.transDelegate setPanGestureWithInteractiveType:WCInteractiveTransitionTypeDismiss direction:WCInteractiveTransitionGestureDirectionRight gestureConifg:nil];
    vc.transitioningDelegate = self.transDelegate;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)presentDemoVC3 {
    self.transDelegate = [WCTransitionManager transitionForTransDelegate1];
    ExDemo3ViewController *vc = [[ExDemo3ViewController alloc] init];
    vc.title = @"demo3";
//    vc.modalPresentationStyle = UIModalPresentationCustom;
    
    __weak typeof(self) weakSelf = self;
    [self.transDelegate setFromViewController:self toViewController:vc];
    [self.transDelegate setPanGestureWithInteractiveType:WCInteractiveTransitionTypePush direction:WCInteractiveTransitionGestureDirectionLeft gestureConifg:^{
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.transDelegate setPanGestureWithInteractiveType:WCInteractiveTransitionTypePop direction:WCInteractiveTransitionGestureDirectionRight gestureConifg:nil];
    self.navigationController.delegate = self.transDelegate;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)presentDemoVC4 {
    self.transDelegate = [WCTransitionManager transitionForTransDelegate4];
    ExDemo4ViewController *vc = [[ExDemo4ViewController alloc] init];
    vc.title = @"demo4";
    vc.transitioningDelegate = self.transDelegate;
    [self.transDelegate setFromViewController:self toViewController:vc];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - WCAnimationViewControllerDelegate
- (UIView *)animationView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 120, 30, 30)];
    return view;
}

#pragma mark - Getters/Setters
- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        _tableView = tableView;
    }
    return _tableView;
}

@end
