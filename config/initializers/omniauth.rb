Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter2, ENV.fetch('TWITTER_KEY'), ENV.fetch('TWITTER_SECRET'), callback_path: ENV.fetch('TWITTER_CALLBACK'), scope: "tweet.read users.read"

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure 
  }
end