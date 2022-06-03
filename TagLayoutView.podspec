Pod::Spec.new do |s|
  s.name             = 'TagLayoutView'
  s.version          = 'v_1.0.0'
  s.summary          = 'SwiftUI library for easy tag display.'
  s.description      = <<-DESC
TagLayoutView enables you to display tags easily.
                       DESC
  s.homepage         = 'https://github.com/giiiita/TagLayoutView'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CSolanaM' => 'carlos.solana.martinez@gmail.com' }
  s.source           = { :git => 'https://github.com/giiiita/TagLayoutView', :tag => s.version.to_s }
  
  s.ios.deployment_target = '12.0'
  
  s.swift_version = '5.0'
  s.source_files = 'Sources/TagLayoutView/**/*'
end
