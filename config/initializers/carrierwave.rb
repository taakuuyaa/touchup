require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1',
      path_style: true
  }

  config.storage :fog
  config.cache_storage = :fog
  config.fog_provider = 'fog/aws'

  case Rails.env
  when 'production'
    config.fog_directory = 'video-upload.production.onstaff'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dummy'

  when 'staging'
    config.fog_directory = 'video-upload.staging.onstaff'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dummy'

  when 'development'
    config.fog_directory = 'video-upload.development.onstaff'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.dummy'

  else
    config.fog_directory = nil
  end

end

# 日本語ファイル名の許可
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
