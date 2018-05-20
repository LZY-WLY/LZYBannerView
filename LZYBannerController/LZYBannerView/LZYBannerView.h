//
//  LZYBannerView.h
//  LZYBannerController
//
//  Created by yfmac001 on 2018/5/20.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZYBannerView;
//创建协议
@protocol LZYBannerViewDelegate <NSObject>

/**
 点击轮播图时 调用
 
 @param bannerView 轮播图对象
 @param row 点击轮播图的row
 */
- (void)bannerView:(LZYBannerView *)bannerView didSelectRow:(NSInteger)row;
@end

/**
 轮播图样式
 LZYBannerViewStyleNone 轮播图不显示PageControl
 LZYBannerViewStylePage 轮播图显示PageControl
 */
typedef enum : NSUInteger {
    LZYBannerViewStyleNone = 0,
    LZYBannerViewStylePage = 1
} LZYBannerViewStyle;




@interface LZYBannerView : UIView
/**
 返回轮播图对象

 @param frame 轮播图的位置
 @param bannerStyle 轮播图样式
 @param dataSoucreBanner 轮播图显示的数据源 (@["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1526795645990&di=f09c38a1145879378cbea1dd28819f64&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201512%2F01%2F20151201174510_uZBwR.jpeg", ...])
 @param changeTime 切换轮播图的时间
 @param delegate 代理
 */
- (instancetype)initWithFrame:(CGRect)frame bannerStyle:(LZYBannerViewStyle)bannerStyle dataSoucreBanner:(NSArray<NSString *> *)dataSoucreBanner changeTime:(int)changeTime delegate:(id<LZYBannerViewDelegate>)delegate;
@end
