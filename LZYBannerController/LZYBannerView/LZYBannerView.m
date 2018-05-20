//
//  LZYBannerView.m
//  LZYBannerController
//
//  Created by yfmac001 on 2018/5/20.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "LZYBannerView.h"
#import "BannerCell.h"

//#define kScrentW [UIScreen mainScreen].bounds.size.width

@interface LZYBannerView ()<UICollectionViewDataSource, UICollectionViewDelegate>
///轮播图显示的样式
@property (nonatomic, assign) NSUInteger bannerStyle;
///轮播图的代理
@property (nonatomic, weak) id<LZYBannerViewDelegate> LZYBannerViewDelegate;
///集合试图
@property (nonatomic, strong) UICollectionView *collection;
///轮播图数据源
@property (nonatomic, strong) NSArray<NSString *> *dataSoucreBanner;
///切换轮播图的时间
@property (nonatomic, assign) int changeTime;
///定时器
@property (nonatomic, strong) NSTimer *timer;
@end

static NSString * const cellId = @"bannerId";

@implementation LZYBannerView
#pragma mark - 懒加载
- (UICollectionView *)collection {
    if (!_collection) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = self.bounds.size;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collection = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collection.dataSource = self;
        _collection.delegate = self;
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.showsHorizontalScrollIndicator = NO;
        _collection.bounces = NO;
        _collection.pagingEnabled = YES;
        [_collection registerNib:[UINib nibWithNibName:@"BannerCell" bundle:nil] forCellWithReuseIdentifier:cellId];
        _collection.contentOffset = CGPointMake(20 * 3 * _collection.bounds.size.width, 0); //设置偏移量
    }
    return _collection;
}
- (instancetype)initWithFrame:(CGRect)frame bannerStyle:(LZYBannerViewStyle)bannerStyle dataSoucreBanner:(NSMutableArray<NSString *> *)dataSoucreBanner changeTime:(int)changeTime delegate:(id<LZYBannerViewDelegate>)delegate {
    if (self = [super initWithFrame:frame]) {
        self.bannerStyle = bannerStyle;
        self.dataSoucreBanner = dataSoucreBanner;
        self.changeTime = changeTime;
        self.LZYBannerViewDelegate = delegate;
        [self addSubview:self.collection];
        //开始定时器
        [self startTimer];
    }
    return self;
}
#pragma mark - UICollectionView协议
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSoucreBanner.count * 1000;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.bannerUrl = self.dataSoucreBanner[indexPath.item % self.dataSoucreBanner.count];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"didSelectItemAtIndexPath");
    if ([self.LZYBannerViewDelegate respondsToSelector:@selector(bannerView:didSelectRow:)]) {
        [self.LZYBannerViewDelegate bannerView:self didSelectRow:indexPath.item % self.dataSoucreBanner.count];
    }
}
#pragma mark - ScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self endTimer];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self startTimer];
}

#pragma mark - 创建定时器
- (void)startTimer {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.changeTime target:self selector:@selector(scrollBanner) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}
#pragma mark - 定时器方法
- (void)scrollBanner {
    //设置偏移量
    CGFloat offestX = self.collection.contentOffset.x + self.collection.bounds.size.width;
    CGPoint point = CGPointMake(offestX, 0);
    [self.collection setContentOffset:point animated:YES];
}
#pragma mark - 停止定时器
- (void)endTimer {
    [self.timer invalidate];
    self.timer = nil;
}
@end
