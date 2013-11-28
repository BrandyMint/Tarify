set :stage, :staging
set :application, 'staging.tarify21.ru'
server 'staging.tarify21.ru', user: 'wwwtarify22', port: 231, roles: %w{web app db}
set :deploy_to, "/home/wwwtarify22/staging.tarify21.ru"
set :rails_env, :staging
set :branch, proc { ENV['BRANCH'] || `git rev-parse --abbrev-ref HEAD`.chomp }
fetch(:default_env).merge!(rails_env: :staging)
