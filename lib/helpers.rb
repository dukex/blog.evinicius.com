module Helpers

  def article_body(article)
    haml(article.template, :layout => false)
  end

  def page_title(title)
    return "blog.evinicius.com" if title.nil?
    "#{title} - blog.evinicius.com"
  end
end
