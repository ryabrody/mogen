require_relative 'page/post'

class Post
  attr_reader :url, :path, :page, :username

  def initialize(page, data)
    @url = URI.parse(data[:url])
    @path = @url.path
    @page = page
    @username = data[:username]
  end

  def like
    post_page = Page::Post.new(page, path)
    open(post_page)
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

  def comment
    post_page = Page::Post.new(page, path)
    open(post_page)
    begin
      if post_page.commented_by?(username)
        puts('already commented') 
        return false
      end
      post_page.comment
      if post_page.commented_by?(username)
        puts("commented: #{url}")
        save_commented_post(url)
        return true
      end
    rescue Capybara::ElementNotFound
      puts "Post #{url} does not exist anymore"
      return false
    end
  end

  private

  def open(post_page)
    begin
      post_page.open
    rescue Capybara::Poltergeist::StatusFailError
      puts("Could not open Post #{url}") 
      return false
    end
  end

  def save_commented_post(url)
    File.open('commented_posts.yml', 'a') do |file|
      file << "- #{url}\n"
    end
  end
end
