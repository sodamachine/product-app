Rails.application.config.middleware.use OmniAuth::Builder destroy
    provider :facebook, ENV['FACEBOOK-KEY'], ENV['FACEBOOK-SECRET']
end