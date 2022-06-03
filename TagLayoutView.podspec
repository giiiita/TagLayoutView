Pod::Spec.new do |s|
  s.name             = 'TagLayoutView'
  s.version          = '0.0.1'
  s.summary          = 'SwiftUI library for easy tag display.'
  s.description      = <<-DESC
TagLayoutView enables you to display tags easily.
                       DESC
  s.homepage         = 'https://github.com/AlexanderMarchant/TagLayoutView'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AlexanderMarchant' => 'alex_marchant@outlook.com' }
  s.source           = { :git => 'https://github.com/AlexanderMarchant/TagLayoutView', :tag => s.version.to_s }
  
  s.ios.deployment_target = '12.0'
  
  s.swift_version = '5.0'
  s.source_files = 'Sources/TagLayoutView/**/*'
end
