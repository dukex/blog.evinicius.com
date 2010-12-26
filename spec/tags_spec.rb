require File.expand_path('../spec_helper', __FILE__)
require 'tags'

describe Tags do
  before(:each)  do
    @tags = Tags.new('spec/fixtures/tags.yml')
  end

  it "should return tags file" do
    @tags.tags_file.should == 'dsdasd'
  end

  it "should return tag 'sinatra' for article xpto" do
    @tags['xpto'].should == 'sinatra' 
  end
end
