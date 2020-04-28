Pod::Spec.new do |spec|
  spec.name         = 'SimpleTabBarAnimations'
  spec.summary      = 'Simple Tab Bar Animations'
  spec.description  = 'Add animations to your tab bar in a simple manner'
  spec.version      = '1.0.0'
  spec.platform     = :ios, '12.0'
  spec.swift_version = '5.0'
  spec.license      = 'MIT'
  spec.homepage     = ''
  spec.author      = { 'ALEKSANDAR GEYMAN' => 'aleksgeyman@gmail.com' }
  spec.summary      = 'Simple Tab Bar Animations'
  spec.source       = { :git => '', :tag => spec.version.to_s }
  spec.source_files = 'SimpleTabBarAnimations/Classes/**/*'
end
