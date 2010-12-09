require 'rubygems'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
require 'rack/test'
require 'haml'

lib_dir = File.expand_path('../../lib', __FILE__)

$:.unshift lib_dir unless $:.include?(lib_dir)

