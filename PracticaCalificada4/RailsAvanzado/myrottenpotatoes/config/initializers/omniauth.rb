# Replace API_KEY and API_SECRET with the values you got from Twitter
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Au94PsKWJjqYmPN7dIpTuqHbd', 'EBIHrBwGNbtLo8otYru6a98OgbhCyTGksP1OPRno2WREQdDeje'

end
