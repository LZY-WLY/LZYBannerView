

Pod::Spec.new do |s|


  s.name         = "LZYBannerView"
  s.version      = "1.0.5"
  s.summary      = "简单方便实现轮播图, 自动轮播"
  s.homepage     = "https://github.com/LZY-WLY/LZYBannerView"
  s.license      = "MIT"
  s.author             = { "lzy" => "18860233120@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/LZY-WLY/LZYBannerView.git", :tag => "#{s.version}" }
  s.source_files  = "LZYBannerView", "LZYBannerView/*.{h,m,xib}"
  s.resource  = "LZYBannerView/bannerViewPlactoler.jpeg"
   s.framework  = "UIKit"
   s.requires_arc = true
   s.dependency "SDWebImage"

end
