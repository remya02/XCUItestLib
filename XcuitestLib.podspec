Pod::Spec.new do |s|
    s.name             = 'XcuitestLib'
    s.version          = '0.0.1'
    s.summary          = 'Library for UItest'

    s.description      = <<-DESC
    This is used for reusing the libraries for XCUItest
    DESC

    s.homepage         = 'https://infygit.ad.infosys.com/Remya.Anjamkudi/xcuitestlib.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'remya' => 'remya.anjamkudi@infosys.com' }
    s.source           = { :git => 'https://infygit.ad.infosys.com/Remya.Anjamkudi/xcuitestlib.git', :tag => s.version.to_s }

    s.ios.deployment_target = '12.1'
    #s.tvos.deployment_target = '10.3'
    #s.swift_version = '4.1.2'
    s.source_files = 'Sources/**/*'

    s.weak_framework = "XCTest"
    s.pod_target_xcconfig = {
        'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "$(PLATFORM_DIR)/Developer/Library/Frameworks"',
    }
end
