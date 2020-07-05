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
  config.fog_provider = 'fog/aws'

  case Rails.env
  when 'production'
    config.fog_directory = 'video-upload.production.onstaff'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dummy'
    config.storage :fog
    config.cache_storage = :fog

  when 'staging'
    config.fog_directory = 'video-upload.staging.onstaff'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dummy'
    config.storage :fog
    config.cache_storage = :fog

  when 'development'
    config.fog_directory = 'video-upload.development.onstaff'
    # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.dummy'
    config.storage :fog
    config.cache_storage = :fog

  when 'test'
    config.storage :file
    config.cache_storage = :file

  else
    config.storage :file
    config.cache_storage = :file
  end

end

# 日本語ファイル名の許可
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
