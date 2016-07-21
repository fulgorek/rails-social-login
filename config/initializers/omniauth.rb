Rails.application.config.middleware.use OmniAuth::Builder do
  # facebook tokens
  provider :facebook, ENV["FACEBOOK_KEY"],
           ENV["FACEBOOK_SECRET"]

  # twitter tokens
  provider :twitter, ENV["TWITTER_SECRET"],
           ENV["TWITTER_KEY"]

  # linked_in tokens
  provider :linked_in, ENV["LINKEDIN_KEY"],
           ENV["LINKEDIN_SECRET"]
end
