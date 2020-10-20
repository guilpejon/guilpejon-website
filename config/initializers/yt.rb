Yt.configure do |config|
  config.api_key = Rails.application.credentials.dig(:google, :youtube_api_secret)
end
