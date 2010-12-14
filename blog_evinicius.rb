$:.unshift File.join(File.expand_path(File.dirname(__FILE__)), 'lib')

require 'sinatra/base'
require 'sinatra/bundles'
require 'time'
require 'article_getter'
require 'helpers'

class BlogEvinicius < Sinatra::Base
  register Sinatra::Bundles

  configure do
    set :app_file, __FILE__
    set :logging, Proc.new { !test? }
    set :run, Proc.new { !test? }
    set :dump_errors, true
    set :haml, {:format => :html5 }
  end
  
  javascript_bundle(:all, %w(jquery.min highlight.pack application))
  stylesheet_bundle(:all, %w(reset 960 text typogridphy application github))

  helpers do
    include Helpers
  end

  before do
    @getter = ArticleGetter.new(File.join(settings.root, "articles"))
  end

  get '/' do
    @articles = @getter.all
    haml :home
  end

  get '/about' do
    @title = 'About'
    haml :about
  end

  get '/stylesheets/:stylesheet.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass :"stylesheets/#{params[:stylesheet]}", :style => :compact
  end

  get '/:id' do
    @article = @getter.find_by_id(params[:id]) || raise(Sinatra::NotFound)
    @title = @article.title
    haml :article
  end

  #get '/articles.atom' do
  #  @articles = @getter.all.sort
  #  content_type 'application/atom+xml'
  #  haml :feed, :layout => false
  #end

  not_found do
    @title = '404 - Page Not Found'
    haml :'404', :layout => false
  end
end


