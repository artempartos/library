set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
# require 'capi/unicorn'
require 'capistrano-unicorn'

set :application, "library"
set :rvm_type, :system
set :rvm_path, "/usr/local/rvm"

set :scm, :git
set :repository,  "git@github.com:vgv/library.git"

set :use_sudo, false
default_run_options[:pty] = true

set :rake, "#{rake} --trace"


namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{release_path}/config/database.yml.sample #{release_path}/config/database.yml"
  end
end

namespace :capi do
  desc 'invoke rake task. Example: cap capi:task_invoke TASK="db:seed"'
  task :task_invoke  do
    run "cd #{deploy_to}/current && bundle exec rake #{ENV['TASK']} RAILS_ENV=#{rails_env}"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db'
after 'deploy:update_code', 'deploy:migrate'
after 'deploy:restart', 'unicorn:stop'
after "deploy:update", "deploy:cleanup"
