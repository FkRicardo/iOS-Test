//
//  ViewController.m
//  Work
//
//  Created by Ricardo on 15/8/31.
//  Copyright (c) 2015年 Ricardo. All rights reserved.
//

#import "ViewController.h"
#import "ImagesViewController.h"
#import "AddressAndMessageViewController.h"
#import "PostImageViewController.h"
#import "AnimationViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *showImages;
@property (weak, nonatomic) IBOutlet UIButton *showTongxunlu;
@property (strong, nonatomic) IBOutlet UIButton *postImage;
@property (strong, nonatomic) IBOutlet UIButton *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.showImages addTarget:self action:@selector(showImagesView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.showTongxunlu addTarget:self action:@selector(showTongxunluView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.postImage addTarget:self action:@selector(showPostImageByHttp) forControlEvents:UIControlEventTouchUpInside];
    
    [self.animationView addTarget:self action:@selector(showAnimationView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showAnimationView
{
    AnimationViewController *avc = [[AnimationViewController alloc] init];
    [self.navigationController pushViewController:avc animated:YES];
}

- (void)showPostImageByHttp
{
    PostImageViewController *pivc = [[PostImageViewController alloc] init];
    [self.navigationController pushViewController:pivc animated:YES];
}

- (void)showTongxunluView
{
    AddressAndMessageViewController *amvc = [[AddressAndMessageViewController alloc] init];
    [self.navigationController pushViewController:amvc animated:YES];
}

- (void)showImagesView
{
    ImagesViewController *ivc = [[ImagesViewController alloc] init];
    [self.navigationController pushViewController:ivc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
