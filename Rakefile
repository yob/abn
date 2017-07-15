require "rubygems"
require "bundler"
Bundler.setup

require 'rake'
require 'rspec/core/rake_task'
require 'roodi'
require 'roodi_task'

require 'abn'

desc "Default: run specs"
task :default => :spec

desc "Run all the specs for the ABN library"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--colour']
end

RoodiTask.new 'roodi', ['lib/**/*.rb']
