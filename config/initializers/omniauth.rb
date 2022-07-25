# Rails.application.config.middleware.use OmniAuth::Builder do
#   # provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
#   provider :google_oauth2, "365201885663-c3uogprnjjn5nc9klb4gej3m99r1ojtp.apps.googleusercontent.com", "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",
#     {
#       scope: 'email, profile, http://gdata.youtube.com',
#       prompt: 'select_account',
#       image_aspect_ratio: 'square',
#       image_size: 50
#     }
# end
# OmniAuth.config.silence_get_warning = true

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['1060199797947821'], ENV['df38408c5b2bafebd8c768b660b9b53a']
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "LUVEVmxRQlV1NTU0bmlhRVpIRUI6MTpjaQ", "gm9mzhwPzzY3xNczmR0EO2fG1lykyXoC"
end