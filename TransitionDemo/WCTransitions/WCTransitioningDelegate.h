//
//  WCTransitioningDelegate.h
//  CustomTransitions
//
//  Created by 丁治文 on 16/6/7.
//  Copyright © 2016年 Two Toasters, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WCTransitionsDefine.h"

@class WCAnimatedTransitioning;
@interface WCTransitioningDelegate : NSObject <
    UIViewControllerTransitioningDelegate,
    UITabBarControllerDelegate,
    UINavigationControllerDelegate >

- (instancetype)initWithPresentAnimatedTransitioning:(WCAnimatedTransitioning *)fromTrans
                        dismissAnimatedTransitioning:(WCAnimatedTransitioning *)toTrans;

- (instancetype)initWithSingleAnimatedTransitioning:(WCAnimatedTransitioning *)singleTrans;

// 推荐设置,设置之后方可使用手势功能
- (void)setFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;
// 添加手势,设置fromVC和toVC之后方可使用手势功能
- (void)setPanGestureWithInteractiveType:(WCInteractiveTransitionType)type direction:(WCInteractiveTransitionGestureDirection)direction gestureConifg:(GestureConifg)gestureConifg;

@end
