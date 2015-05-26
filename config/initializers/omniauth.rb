Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '874703875881859', '7033294359306d4c3b5f0704f5e0893f', :scope => 'public_profile,email,user_birthday,read_stream,user_friends,publish_actions'
  provider :vkontakte, '4661158', 'j7R51O0m2Pa1hRbtDtsC', :scope => 'friends,email,status'
end
#654234611375426      a7b4d857361866582e1af219bb1894c5    my app
#874703875881859      7033294359306d4c3b5f0704f5e0893f    unit systems