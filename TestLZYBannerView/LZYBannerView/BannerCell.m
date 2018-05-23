//
//  BannerCell.m
//  YFiOS
//
//  Created by yfmac001 on 2018/4/11.
//  Copyright © 2018年 yfmac001. All rights reserved.
//

#import "BannerCell.h"
#import <UIImageView+WebCache.h>

@interface BannerCell ()
///背景图
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation BannerCell

- (void)setBannerUrl:(NSString *)bannerUrl {
    _bannerUrl = bannerUrl;
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:bannerUrl] placeholderImage:[UIImage imageNamed:@"bannerViewPlactoler.jpeg"]];
}

@end
