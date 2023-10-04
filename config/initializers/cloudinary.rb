Cloudinary.config do |config|
  config.cloud_name = ENV.fetch('CLOUD_NAME', nil)
  config.api_key = ENV.fetch('CLOUD_API_KEY', nil)
  config.api_secret = ENV.fetch('CLOUD_API_SECRET', nil)
  config.secure = true
end
