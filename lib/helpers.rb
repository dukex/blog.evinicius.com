module Helpers

  def article_body(article)
    haml(article.template, :layout => false)
  end

  def article_path(article)
    "/#{article.id}"
  end

  def link_to(text, url)
    "<a href='#{url}'> #{text}</a>"
  end

  def page_title(title)
    return "blog.evinicius.com" if title.nil?
    "#{title} - blog.evinicius.com"
  end
end
