Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1499552633639161', '2ad1380d9b66a11457ac1351e0975afb'
end
