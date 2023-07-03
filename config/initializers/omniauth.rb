Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter2, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"], callback_path: ENV["TWITTER_CALLBACK"], scope: "tweet.read users.read"

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure 
  }
end