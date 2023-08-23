workspace 'MixedFramework.xcworkspace'
platform :ios, '12.0'

def ads_pod
  pod 'Google-Mobile-Ads-SDK', '~> 9.14.0'
end

target 'MixedFramework' do
  project 'MixedFramework/MixedFramework.xcodeproj'
  ads_pod
end

target 'MixedXCFrameworkConsumer' do
  project 'MixedXCFrameworkConsumer/MixedXCFrameworkConsumer.xcodeproj'
  ads_pod
end