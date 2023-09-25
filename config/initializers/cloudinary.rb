Cloudinary.config do |config|
  config.cloud_name = ENV.fetch('CLOUD_NAME')
  config.api_key = ENV.fetch('CLOUD_API_KEY')
  config.api_secret = ENV.fetch('CLOUD_API_SECRET')
  config.secure = true
end
