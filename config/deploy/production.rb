set :rails_env, 'production'

set :deploy_to, "/home/app/#{application}"

set :branch, "master"
set :user, 'app'

set :keep_releases, 2

role :web, "37.139.5.144"
role :app, "37.139.5.144"
role :db,  "37.139.5.144", :primary => true
