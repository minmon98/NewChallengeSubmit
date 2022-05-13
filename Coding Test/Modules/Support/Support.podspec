Pod::Spec.new do |s|
  s.name             = 'Support'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Support.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/PhiVanMinh/Support'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PhiVanMinh' => 'minh.phi@savvycomsoftware.com' }
  s.source           = { :git => 'https://github.com/PhiVanMinh/Support.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Support/**/**/*'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Support/**/**/*'
  end

  s.weak_framework = 'libswiftXCTest'
  s.weak_framework = 'XCTest'
  s.dependency 'Alamofire', '~> 4.7'
  s.dependency 'Constant'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
end
