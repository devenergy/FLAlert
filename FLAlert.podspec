Pod::Spec.new do |s|
  s.name     = 'FLAlert'
  s.version  = '1.0'
  s.ios.deployment_target   = '7.0'
  s.summary  = 'Simple alert alternative which plays well with xib customization'
  s.author   = { 'Anton Gaenko' => 'antony.gaenko@gmail.com' }
  s.social_media_url = 'https://twitter.com/Anton_Gaenko'
  s.requires_arc = true
  s.source   = {
    :git => 'https://github.com/devenergy/FLAlert.git',
    :branch => 'master',
    :tag => s.version.to_s
  }
  s.source_files = '*.{h,m}'
  s.public_header_files = '*.h'
end
