# Load DSL and Setup Up Stages
require 'capistrano/version'
load 'deploy'

require 'bundler/capistrano'
require 'rvm/capistrano'
require 'puma/capistrano'
load 'deploy/assets'
load 'config/deploy'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }