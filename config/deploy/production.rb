set :stage, :production
server 'tarify21.ru', user: 'wwwtarify21', port: 231, roles: %w{web app db}
set :rails_env, :production
set :branch, ENV['BRANCH'] || 'master'
fetch(:default_env).merge!(rails_env: :production)
