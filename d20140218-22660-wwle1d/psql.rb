#!/usr/bin/env ruby

require "yaml";

DB_YML_2_PG_ENV = {
    'database' => 'PGDATABASE',
    'hostname' => 'PGHOST',
    'password' => 'PGPASSWD',
    'port'     => 'PGPORT',
    'username' => 'PGUSER'
}

database_yml = ENV["DATABASE_YML"] || File.expand_path('../../config/database.yml', __FILE__)
rails_env = ENV["DATABASE_RAILS_ENV"] || ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "production"

config = YAML.load_file(database_yml)[rails_env] or raise ArgumentError, "no configuration for #{rails_env}"

config.each do |k, v|
    ENV[DB_YML_2_PG_ENV[k]] ||= v if DB_YML_2_PG_ENV.key?(k)
end

exec(File.basename($0).chomp(".rb"), *ARGV)
