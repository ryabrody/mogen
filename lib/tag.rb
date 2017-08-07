require_relative 'page/tag'
require_relative '../lib/post'

class Tag
  attr_reader :hash, :name, :session

  def initialize(session, name)
    @name = name
    @hash = "##{name}"
    @session = session
  end

  def posts(num)
    tags_page = Page::Tag.new(session.page, name)
    tags_page.load_max(num)
    begin
      tags_page.open
    rescue Capybara::Poltergeist::StatusFailError
      return []
    end
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
