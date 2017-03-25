# frozen_string_literal: true
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Rails.application.load_tasks

task default: [:spec]

RSpec::Core::RakeTask.new(:rspec)

desc 'Run rspec tests'
task spec: [:rspec, :rubocop]

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
end
