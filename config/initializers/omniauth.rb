Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '874703875881859', '7033294359306d4c3b5f0704f5e0893f', :scope => 'public_profile, email, user_birthday,read_stream,publish_stream,user_friends,publish_actions'
  provider :vkontakte, '4661158', 'j7R51O0m2Pa1hRbtDtsC', :scope => 'friends,email,status'
end
