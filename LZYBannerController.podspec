#
#  Be sure to run `pod spec lint LZYBannerController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|



  s.name         = "LZYBannerView"
  s.version      = "1.0.3"
  s.summary      = "简单方便实现轮播图, 自动轮播"

  s.description  = <<-DESC
                        简单方便实现轮播图, 自动轮播, 可以设置轮播切换的时间, 轮播图显示的样式
                   DESC

  s.homepage     = "https://github.com/LZY-WLY/LZYBannerView.git"


  s.license      = "MIT"
s.license      = { :type => "MIT", :file => "FILE_LICENSE" }



  s.author             = { "lzy" => "18860233120@163.com" }
   s.social_media_url   = "https://www.jianshu.com/u/3af5c5e3f2eb"

   s.platform     = :ios
   s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/LZY-WLY/LZYBannerView.git", :tag => "#{s.version}" }

  s.source_files  = "LZYBannerController", "LZYBannerController/LZYBannerView/*.{h,m,xib}"

   s.resource  = "bannerViewPlactoler@2x.jpeg"

   s.framework  = "UIKit"

   s.requires_arc = true
    s.dependency "SDWebImage"

end
