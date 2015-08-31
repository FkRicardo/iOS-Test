//
//  AnimationViewController.h
//  Work
//
//  Created by Ricardo on 15/8/31.
//  Copyright (c) 2015年 Ricardo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationViewController : UIViewController

+ (void)rotateWithView:(UIView *) retateView
                 angle:(NSInteger) angle
                  time:(NSInteger) time;

@end
