Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter2, ENV.fetch('TWITTER_KEY', nil), ENV.fetch('TWITTER_SECRET', nil), callback_path: ENV.fetch('TWITTER_CALLBACK', nil), scope: "tweet.read users.read"

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure 
  }
end