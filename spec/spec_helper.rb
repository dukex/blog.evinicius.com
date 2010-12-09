lib_dir = File.expand_path('../../lib', __FILE__)
$:.unshift lib_dir unless $:.include?(lib_dir)

require 'rubygems'
require 'sinatra'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
require 'rack/test'
require 'haml'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

module HelperMethods
  def fixture(id)
    "#{File.read(File.dirname(__FILE__) + "/fixtures/articles/#{id}.html")}"
  end
end

Spec::Runner.configure do |config|
  config.include(HelperMethods) 
end
