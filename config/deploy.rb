set :application, 'library'

#set :rvm_type, :system
#set :rvm_ruby_string, 'ruby-1.9.3-p327@default'
#set :whenever_command, "bundle exec whenever" # update crontab

set :stages, %w(production)
set :default_stage, "production"

require 'capistrano/ext/multistage'

set :repository, 'http://github.com/artempartos/library'

set :deploy_to, '/u/apps/library'
set :scm, :git

set :use_sudo, false
set :ssh_options, forward_agent: true
set :rake, "#{rake} --trace"

default_run_options[:pty] = true

set :keep_releases, 5

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, roles: :app do
    run "ln -nfs #{release_path}/config/database.sample.yml #{release_path}/config/database.yml"
  end

  desc "Seed database data"
  task :db_seed do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end
end

after "deploy:finalize_update", "deploy:symlink_db"
after "deploy:restart", "unicorn:stop"
after "deploy:update", "deploy:cleanup"
