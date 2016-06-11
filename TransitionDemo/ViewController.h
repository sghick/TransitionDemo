//
//  ViewController.h
//  TransitionDemo
//
//  Created by 丁治文 on 16/6/11.
//  Copyright © 2016年 sumrise.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCTransitionsDefine.h"

@interface ViewController : UIViewController<WCAnimationViewControllerDelegate>

- (UIView *)animationView;

@end

