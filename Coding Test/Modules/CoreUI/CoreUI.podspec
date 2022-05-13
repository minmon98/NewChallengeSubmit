Pod::Spec.new do |s|
  s.name             = 'CoreUI'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CoreUI.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/PhiVanMinh/CoreUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PhiVanMinh' => 'minh.phi@savvycomsoftware.com' }
  s.source           = { :git => 'https://github.com/PhiVanMinh/CoreUI.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'CoreUI/Classes/**/*'
  s.dependency 'Core'
end
