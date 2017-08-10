require_relative 'page/tag'
require_relative '../lib/post'

class Tag
  attr_reader :hash, :name, :session, :posts

  def initialize(session, name)
    @name = name
    @hash = "##{name}"
    @session = session
    @posts ||= posts
  end

  def posts(num = 3)
    tags_page = Page::Tag.new(session.page, name)
    begin
      tags_page.open
    rescue Capybara::Poltergeist::StatusFailError
      puts "Could not open  #{@hash} tag page" 
      return []
    end
    tags_page.load_max(num)
    tags_page.posts_urls.map do |url| 
      Post.new(session.page, url: url[:href]) 
    end
  end

  def like_posts(limit)
    posts(limit).each do |post|
      if post.like
        session.like_counter += 1
        puts "Number of likes: #{session.like_counter}"
      end
    end
  end
end
