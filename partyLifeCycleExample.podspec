Pod::Spec.new do |s|
  s.name             = 'partyLifeCycleExample'
  s.version          = '1.0.0'
  s.summary          = 'A short description of partyLifeCycleExample.'

  s.description      = <<-DESC
  partyLifeCycleSDK contains the plans and phases for each client, standardizing all CoreClient flows
                        DESC

  s.homepage         = 'https://github.com/Christian Morante/partyLifeCycleExample'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Christian Morante' => 'cris.cams.kira@gmail.com' }
  s.source           = { :git => 'https://github.com/Christian Morante/partyLifeCycleExample.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'

  s.source_files = 'partyLifeCycleExample/Classes/**/*'
  
  s.resource_bundles = {
    'partyLifeCycleSDK' => ['partyLifeCycleSDK/Assets/*']
  }

  s.test_spec 'UnitTests' do |unit_tests_spec|
    unit_tests_spec.source_files = 'WardaSDK/Tests/UnitTests/**/*', 'WardaSDK/Tests/Commons/**/*'
  end

  s.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS[config=Testing]' => '-DTESTING', }
  
  s.dependency 'Alamofire'

  s.xcconfig = { 'LD_RUNPATH_SEARCH_PATHS' => '$(FRAMEWORK_SEARCH_PATHS)', 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
  
end
