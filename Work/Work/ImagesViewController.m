//
//  ImagesViewController.m
//  Work
//
//  Created by Ricardo on 15/8/31.
//  Copyright (c) 2015年 Ricardo. All rights reserved.
//

#import "ImagesViewController.h"
#define ImagesNumber 5

@interface ImagesViewController () <UIScrollViewDelegate>

@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)UIPageControl *pageControl;
@property (strong, nonatomic)NSTimer *timer;
@end

@implementation ImagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置图片
    for (int i = 0; i < ImagesNumber; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.png",i+1];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = self.scrollView.bounds;
        [self.scrollView addSubview:imageView];
    }
    
    //计算imageView
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL *stop) {
        //调整x origin frame
        CGRect frame = imageView.frame;
        frame.origin.x = idx*frame.size.width;
        
        imageView.frame = frame;
        
    }];
    
    
    //分页初始页为0
    self.pageControl.currentPage = 0;
    
    //启动时钟
    [self startTimer];
}

- (void)startTimer
{
    self.timer  = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    //添加到运行循环(个人感觉是线程)
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updateTimer
{
    //页面发生变化
    int currentPage = (self.pageControl.currentPage + 1) % ImagesNumber;
    self.pageControl.currentPage = currentPage;
    
    //调用监听方法
    [self pageChange:self.pageControl];
    
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 130, 300, 130)];
//        _scrollView.backgroundColor = [UIColor redColor];
        
        //取消弹簧效果
        _scrollView.bounces = NO;
        
        //取消滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        
        //分页
        _scrollView.pagingEnabled = YES;
        
        _scrollView.contentSize = CGSizeMake(ImagesNumber * _scrollView.frame.size.width, 0);
        
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        
        //分页数
        _pageControl.numberOfPages = ImagesNumber;
        
        //控件尺寸
        CGSize size = [_pageControl sizeForNumberOfPages:ImagesNumber];
        
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(self.view.center.x, 240);
        
        //设置颜色
        _pageControl.pageIndicatorTintColor = [UIColor redColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
        
        [self.view addSubview:_pageControl];
        
        /** 在OC中，绝大多数"控件"，都可以监听UIControlEventValueChanged事件，button除外" */
        [_pageControl addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

//分页控制的监听方法
- (void)pageChange:(UIPageControl *)pageControl
{
    //根据页数，调整滚动视图中的图片位置contentOffset
    CGFloat x = pageControl.currentPage *self.scrollView.bounds.size.width;
    [self.scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
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
