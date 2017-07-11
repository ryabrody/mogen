require_relative 'page/post'

class Post
  attr_reader :url, :path, :page

  def initialize(page, data)
    @url = URI.parse(data[:url])
    @path = @url.path
    @page = page
  end

  def like
    post_page = Page::Post.new(page, path)
    post_page.open
    begin
      if post_page.liked?
        puts('already liked') 
        return false
      end
      post_page.like
      if post_page.liked?
        puts("liked: #{url}")
        return true
      end
    rescue Capybara::ElementNotFound
      puts "Post #{url} does not exist anymore"
      return false
    end
  end
end
