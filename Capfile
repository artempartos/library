# Load DSL and Setup Up Stages
require 'capistrano/version'
load 'deploy'

require 'bundler/capistrano'
require 'rvm/capistrano'
#load 'deploy/assets'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
load 'config/deploy'

require 'capistrano-unicorn'
