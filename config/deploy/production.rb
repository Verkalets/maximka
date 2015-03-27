set :rails_env, 'production'
set :domain, "52.28.15.212"
set :application, "wifi"
set :deploy_to, '/home/deploy/wifi'
role :web, '52.28.15.212', user: 'deploy'
