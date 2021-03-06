Pod::Spec.new do |s|
  s.name             = "AftermathTools"
  s.summary          = "Development tools for Aftermath."
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/hyperoslo/AftermathTools"
  s.license          = 'MIT'
  s.author           = {
    "Hyper Interaktiv AS" => "ios@hyper.no"
  }
  s.source           = {
    :git => "https://github.com/hyperoslo/AftermathTools.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.2'

  s.requires_arc = true
  s.ios.source_files = 'Sources/**/*'

  s.frameworks = 'Foundation'
  s.dependency 'Aftermath'
end
