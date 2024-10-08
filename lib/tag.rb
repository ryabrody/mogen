require_relative 'page/tag'
require_relative '../lib/post'

class Tag
  attr_reader :hash, :name, :session

  def initialize(session, name)
    @name = name
    @hash = "##{name}"
    @session = session
  end

  def posts(limit)
    tags_page = Page::Tag.new(session.page, name)
    tags_page.open
    # begin
    # rescue Capybara::Poltergeist::StatusFailError
    #   puts "Could not open  #{@hash} tag page" 
    #   return []
    # end
    # tags_page.load_max_urls(limit).map do |url|
    #   Post.new(session.page, url: url, username: session.user.username) 
    # end
    tags_page.load_max_urls(limit).map { |url| Post.new(session.page, url: url, username: session.user.username) }
  end

  def like_posts(limit)
    binding.pry
    # TODO here ia m logged out
    posts(limit).each do |post|
      if post.like
        session.like_counter += 1
        puts "Number of likes: #{session.like_counter} for #{session.user.username}"
        sleep rand(28..30)
      end
    end
  end

  def comment_posts(limit)
    posts(limit).each do |post|
      if post.comment
        session.comment_counter += 1
        puts "Number of comments: #{session.comment_counter}"
      end
    end
  end
end
