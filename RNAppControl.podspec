require 'json'

packageJson = JSON.parse(File.read(File.join(__dir__, 'package.json')))
version = packageJson["version"]
description = packageJson["description"]
homepage = packageJson["homepage"]
license = packageJson["license"]
author = packageJson["author"]
repository = packageJson["repository"]["url"]

Pod::Spec.new do |s|
	s.name           = "RNAppControl"
	s.version        = version
	s.description    = description
	s.homepage       = homepage
	s.summary        = "Exit,close,kill,shutdown app completely for React Native"
	s.license        = license
	s.authors        = author
	s.source         = { :git => repository + ".git", :tag => version }
	s.platforms      = { :ios => "12.4", :tvos => "11.0" }
	s.preserve_paths = 'README.md', 'package.json', '*.js'
	s.source_files   = 'ios/RNAppControl/**/*.{h,m,mm}'

	# Use install_modules_dependencies helper to install the dependencies if React Native version >=0.71.0.
	# See https://github.com/facebook/react-native/blob/febf6b7f33fdb4904669f99d795eba4c0f95d7bf/scripts/react_native_pods.rb#L79.
	if respond_to?(:install_modules_dependencies, true)
	  install_modules_dependencies(s)
	else
	  s.dependency "React-Core"
	
	  # Don't install the dependencies when we run `pod install` in the old architecture.
	  if ENV["RCT_NEW_ARCH_ENABLED"] == "1"
		s.compiler_flags = "-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -DRCT_NEW_ARCH_ENABLED=1"
		s.pod_target_xcconfig = {
		  "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
		  "OTHER_CPLUSPLUSFLAGS" => "-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1",
		  "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
		}
	
		s.dependency "ReactCodegen"
		s.dependency "React-RCTFabric"
		s.dependency "RCT-Folly"
		s.dependency "RCTRequired"
		s.dependency "RCTTypeSafety"
		s.dependency "ReactCommon/turbomodule/core"
	  end
	end
end
