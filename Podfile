
platform :ios, '14.0'

install! 'cocoapods', :warn_for_unused_master_specs_repo => false

target 'Atlastefem' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!

  pod 'SDWebImageSwiftUI'
  pod 'SwiftLint'
  pod 'Swinject'

  target 'AtlastefemTests' do
    inherit! :search_paths
    pod 'SwiftLint'
    pod 'OHHTTPStubs/Swift'
    pod 'Quick'
    pod 'Nimble'
  end

  target 'AtlastefemUITests' do
    pod 'SwiftLint'
    pod 'OHHTTPStubs/Swift'
  end

end
