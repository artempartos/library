require 'capistrano/version' #https://github.com/benjamintanweihao/bundler/commit/253f2b7993bc1ef8a2c48ba25333e914aebb6779
load 'deploy'
require 'bundler/capistrano'
require 'rvm/capistrano'
# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
load 'config/deploy' # remove this line to skip loading any of the default tasks

require 'capistrano-unicorn'
