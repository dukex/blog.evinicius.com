require File.expand_path('../spec_helper', __FILE__)
require 'article_getter'

describe 'ArticleGetter' do

  before(:each) do
    @getter = ArticleGetter.new('spec/fixtures/articles')
  end

  it 'should return all article file names' do
    f = @getter.files[0]
    File.extname(f).should == '.haml'
  end

  it 'should return all Articles' do
    @getter.all[0].instance_of?(Article).should be_true
  end
  
  it 'should return true for first article when called first?' do
    @getter.all[0].first?.should be true
  end
    
  it 'should return false for second article when called first?' do
    articles = @getter.all
    articles[1].first?.should_not be true
  end


  it 'should return a file by name (aka ID)' do
    @getter.find_by_id('view-first').title.should == 'View First'
  end

  it 'should return a file by name (aka ID) when accessing via an indexer' do
    @getter['view-first'].title.should == 'View First'
  end

  it 'should be able to parse "title" out of a line up' do
    fake_article = "blah -#title: Fake Title\n\r some new shizzle"
    @getter.template_variable(fake_article, 'title').should == 'Fake Title'
  end

  it 'should return a date' do
    @getter.parse_date('2009-11-12').instance_of?(Time).should be_true
  end
end
