Pod::Spec.new do |s|
    s.name             = 'XcuitestLib'
    s.version          = '1.0.0'
    s.summary          = 'Library for UItest'

    s.description      = <<-DESC
    This is used for reusing the libraries for XCUItest
    DESC

    s.homepage         = 'https://infygit.ad.infosys.com/Remya.Anjamkudi/xcuitestlib.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'remya' => 'remya.anjamkudi@infosys.com' }
    s.source           = { :git => 'https://github.com/remya02/XCUItestLib.git', :tag => s.version.to_s }

    s.ios.deployment_target = '10.1'
    #s.tvos.deployment_target = '10.3'
    s.swift_version = '4.0'
    s.source_files = 'Sources/**/*'

    s.framework = 'XCTest'
    s.pod_target_xcconfig = {
        'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks'
    }
end
