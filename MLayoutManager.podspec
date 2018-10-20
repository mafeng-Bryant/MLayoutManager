Pod::Spec.new do |s|
s.name             = 'MLayoutManager'
s.version          = '1.0.3'
s.summary          = 'A short description of MLayoutManager.'
s.description      = <<-DESC
TODO: Add long description of the pod here.
DESC
s.homepage         = 'https://github.com/mafeng-Bryant/MLayoutManager'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { '1499603656@qq.com' => 'feng.ma@patpat.com' }
s.source           = { :git => 'https://github.com/mafeng-Bryant/MLayoutManager.git', :tag => s.version.to_s }
s.ios.deployment_target = '8.0'
s.source_files = 'MLayoutManager/Classes/**/*'
end

