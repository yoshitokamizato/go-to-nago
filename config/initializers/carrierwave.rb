require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|
  if Rails.env.production?
  # if Rails.env.development?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = ENV['AWS_S3_BUCKET']
    config.fog_credentials = {
      provider: 'AWS',
      use_iam_profile: true,
      # aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      # aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
  else
    config.storage = :file
  end
end