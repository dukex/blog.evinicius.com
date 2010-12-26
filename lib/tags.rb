class Tags
  attr_accessor :tags_file
  
  def initialize(path_tags_file) 
    tags_file = File.read(@tags_file)
  end

  def [](id)
    'sinatra'
  end
end
