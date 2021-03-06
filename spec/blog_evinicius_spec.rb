require File.expand_path('../spec_helper', __FILE__)
require File.expand_path('../../blog_evinicius', __FILE__)

BlogEvinicius.set :environment, :test

describe BlogEvinicius do
  include Rack::Test::Methods

  def app
    BlogEvinicius
  end

  it 'should return true for BlogEvinicius is kind of Sinatra::Base' do
    blog = BlogEvinicius.new
    blog.kind_of?(Sinatra::Base).should be true
  end

  it 'should respond to /' do
    get '/'
    last_response.should be_ok
  end

  it 'should return the correct content-type when viewing the root' do
    get '/'
    last_response.headers['Content-Type'].should == 'text/html'
  end

  it 'should return content when viewing the root' do
    get '/'
    last_response.headers['Content-Length'].to_i.should > 0
  end

  it 'should respond to /about' do
    get '/about'
    last_response.should be_ok
  end

  it 'should respond to /apresentando-o-micro-framework-sinatra' do
    get '/apresentando-o-micro-framework-sinatra'
    last_response.should be_ok
  end

  it 'should be css in the headers when getting css' do
    get '/stylesheets/application.css'
    last_response.headers['Content-Type'].should == 'text/css'
  end

  it 'should respond to /application.css' do
    get '/stylesheets/application.css'
    last_response.should be_ok
  end

  it 'should return 404 when page cannot be found' do
    get '/404'
    last_response.status.should == 404
  end

end
