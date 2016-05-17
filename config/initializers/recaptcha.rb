Recaptcha.configure do |config|
  if Rails.env.production?
    config.public_key  = ENV['captcha_public_key']
    config.private_key = ENV['captcha_private_key']
  else
    config.public_key  = Rails.application.secrets.captcha_public_key
    config.private_key = Rails.application.secrets.captcha_private_key
  end
end
