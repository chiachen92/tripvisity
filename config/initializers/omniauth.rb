OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '318441081888588', '8400d86781f5dc1a94611ea37fb1658b'
end
