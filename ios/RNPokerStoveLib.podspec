
require "json"

package = JSON.parse(File.read(File.join(__dir__, "..", "package.json")))
version = package['version']

Pod::Spec.new do |s|
  s.name         = "RNPokerStoveLib"
  s.version      = "1.0.0"
  s.summary      = "RNPokerStoveLib"
  s.description  = <<-DESC
                  This is ReactNative wrapper for poker stove c++ library developed by Andrew Prock. This code is publicly available at https://github.com/andrewprock/pokerstove
                   DESC
  s.homepage     = "https://github.com/saachitech/RNPokerStoveLib.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/saachitech/RNPokerStoveLib.git", :tag => "master" }
  s.source_files  = "pokerstove/**/*.{h,m,mm,cpp}"
  s.requires_arc = true
  

  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"${PODS_ROOT}/Headers/Public/RNPokerStoveLib\" \"$(PODS_ROOT)/boost-for-react-native\"" }
  s.user_target_xcconfig   = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/Headers/Private/RNPokerStoveLib\""}
  
  s.source_files = "*.{h,mm,m,cpp}"
  s.header_dir   = "pokerstove"

  s.subspec "pokerstove" do |ss|
    ss.source_files          = "pokerstove/*"
  end


  s.subspec "penum" do |ss|
    ss.source_files = "pokerstove/penum/*.{h,mm,m,cpp}"
    ss.header_dir   = "pokerstove/penum"
  end
  s.subspec "peval" do |ss|
    ss.source_files = "pokerstove/peval/*.{h,mm,m,cpp}"
    ss.header_dir   = "pokerstove/peval"
  end
  s.subspec "util" do |ss|
    ss.source_files = "pokerstove/util/*.{h,mm,m,cpp}"
    ss.header_dir   = "pokerstove/util"
  end

  s.dependency "React"
  #s.dependency "others"

end

  
