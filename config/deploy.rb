# config valid only for Capistrano 3.1
#lock '3.0.1'

set :application, 'wifi'
set :repo_url, 'https://github.com/Verkalets/maximka'
set :deploy_to, '/home/deploy/wifi'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do
  unicorn_conf = "#{deploy_to}/current/config/unicorn.rb"
  unicorn_pid = "#{deploy_to}/shared/pids/unicorn.pid"

  desc 'Restart application'
  task :restart do
    on roles(:all), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      execute "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -E production -c #{unicorn_conf} -D; fi"
    end
  end

  task :start do
    on roles(:all), in: :sequence, wait: 5 do
      execute "cd #{deploy_to}/current/ && bundle exec unicorn_rails -E production -c #{unicorn_conf} -D"
      execute "echo Hello"
    end
  end
  task :stop do
    on roles(:all), in: :sequence, wait: 5 do
      execute "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
