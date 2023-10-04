Sidekiq.configure_server do |config|
  config.redis = { url: Rails.env.production? ? ENV.fetch('REDIS_URL', nil) : "redis://redis:6379" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Rails.env.production? ? ENV.fetch('REDIS_URL', nil) : "redis://redis:6379" }
end
