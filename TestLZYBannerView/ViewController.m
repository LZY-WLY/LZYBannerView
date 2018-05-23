//
//  ViewController.m
//  TestLZYBannerView
//
//  Created by yfmac001 on 2018/5/20.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "ViewController.h"
#import "LZYBannerView.h"
#import <objc/runtime.h>

@interface ViewController ()<LZYBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    unsigned int count = 0;
//    
//    Ivar *ivar = class_copyIvarList([UIPageControl class], &count);
//    
//    for (int i = 0; i < count; i++) {
//        
//        const char *charStr = ivar_getName(ivar[i]);
//        const char *charType = ivar_getTypeEncoding(ivar[i]);
//        
//        NSString *str =  [NSString stringWithCString:charStr  encoding:NSUTF8StringEncoding];
//        NSString *type =  [NSString stringWithCString:charType  encoding:NSUTF8StringEncoding];
//
//        NSLog(@"%@  %@", str, type);
//        
//    }
    
    //添加轮播图
    NSArray *bannerArray = @[@"http://yjapitest.yidaoo.cn:7777/static/upload/image/1banner@2x.png",
                             @"http://yjapitest.yidaoo.cn:7777/static/upload/image/2banner@2x.png"];
    
    CGRect frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 90);
//    LZYBannerView *bannerView = [[LZYBannerView alloc]initWithFrame:frame bannerStyle:LZYBannerViewStylePage dataSoucreBanner:bannerArray changeTime:3 delegate:self];
    
    LZYBannerView *bannerView = [[LZYBannerView alloc]initWithFrame:frame bannerStyle:LZYBannerViewStylePage dataSoucreBanner:bannerArray changeTime:3 pageControlImage:[UIImage imageNamed:@"page"] currentPageControlImage:[UIImage imageNamed:@"currenPage"] delegate:self];
//    bannerView.currentPageControlColor = [UIColor blackColor];
//    bannerView.pageControlColor = [UIColor greenColor];
    [self.view addSubview:bannerView];
}

#pragma mark - LZYBannerViewDelegate
- (void)bannerView:(LZYBannerView *)bannerView didSelectRow:(NSInteger)row {
    NSLog(@"index  %zd", row);
}



@end
