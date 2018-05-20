//
//  ViewController.m
//  TestLZYBannerView
//
//  Created by yfmac001 on 2018/5/20.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "ViewController.h"
#import "LZYBannerView.h"

@interface ViewController ()<LZYBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加轮播图
    NSArray *bannerArray = @[@"http://yjapitest.yidaoo.cn:7777/static/upload/image/1banner@2x.png",
                             @"http://yjapitest.yidaoo.cn:7777/static/upload/image/2banner@2x.png"];
    CGRect frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 90);
    LZYBannerView *bannerView = [[LZYBannerView alloc]initWithFrame:frame bannerStyle:LZYBannerViewStyleNone dataSoucreBanner:bannerArray changeTime:3 delegate:self];
    [self.view addSubview:bannerView];
}

#pragma mark - LZYBannerViewDelegate
- (void)bannerView:(LZYBannerView *)bannerView didSelectRow:(NSInteger)row {
    NSLog(@"index  %zd", row);
}



@end
