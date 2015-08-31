//
//  AnimationViewController.m
//  Work
//
//  Created by Ricardo on 15/8/31.
//  Copyright (c) 2015年 Ricardo. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (strong, nonatomic)UIImageView *imageView;
@property (strong, nonatomic)NSArray *angles;

@end

@implementation AnimationViewController

+ (void)rotateWithView:(UIView *) retateView
                 angle:(NSInteger) angle
                  time:(NSInteger) time
{
    CGFloat angleOfM_PI = angle * M_PI / 180;
    [UIView animateWithDuration:time animations:^{
        if (angleOfM_PI > M_PI) {
            retateView.transform = CGAffineTransformMakeRotation(M_PI);
            CGFloat angleLostPi = angleOfM_PI - M_PI;
            [self rotateWithView:retateView angle:angleLostPi time:time];
        }else{
            retateView.transform = CGAffineTransformMakeRotation(angleOfM_PI);
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button setTitle:@"开始动画" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(retate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 150, 150)];
    [_imageView setImage:[UIImage imageNamed:@"1.png"]];
    [self.view addSubview:_imageView];
    
    self.angles = @[@"0", @"23", @"72", @"90", @"180", @"273", @"768"];
}

- (void)retate
{
    NSString *angle = self.angles[arc4random()%7];
    [AnimationViewController rotateWithView:_imageView angle:[angle integerValue] time:1];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
