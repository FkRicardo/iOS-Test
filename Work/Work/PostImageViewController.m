//
//  PostImageViewController.m
//  Work
//
//  Created by Ricardo on 15/8/31.
//  Copyright (c) 2015年 Ricardo. All rights reserved.
//

#import "PostImageViewController.h"

@interface PostImageViewController () <NSURLConnectionDataDelegate>//网络请求协议
@property (strong, nonatomic)UIImageView *imageView;
@property (strong, nonatomic)NSMutableData *receiveData;

@end

@implementation PostImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_imageView];
    
    [self performSelector:@selector(requestImage) withObject:nil afterDelay:1];
}

- (void)requestImage
{
    NSURL *imageURL = [NSURL URLWithString:@"http://photo.hanyu.iciba.com/upload/encyclopedia_2/53/a0/bk_53a00b172b79ece05834bb36e6229112_gkXzjF.jpg"];
    //网络请求的载体
    NSURLRequest *request = [NSURLRequest requestWithURL:imageURL];
    //发网络请求
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    self.receiveData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self.imageView setImage:[UIImage imageWithData:self.receiveData]];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请检查你的网络" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [av show];
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
