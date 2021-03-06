module ApplicationHelper
  def full_title(page_title = '')
    base_title = '名護へGO'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def full_url(path)
    domain = if Rails.env.development?
               'http://0.0.0.0:3000'
             else
               'https://go-to-nago.com/'
             end
    "#{domain}#{path}"
  end
end
