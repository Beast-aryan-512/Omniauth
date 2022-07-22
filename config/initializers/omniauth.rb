Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  provider :google_oauth2, "365201885663-c3uogprnjjn5nc9klb4gej3m99r1ojtp.apps.googleusercontent.com", "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",
    {
      scope: 'email, profile, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
    }
end
OmniAuth.config.silence_get_warning = true