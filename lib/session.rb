require 'capybara'
require 'capybara/dsl'
require 'capybara/cuprite'
require 'pry'
require 'yaml'
require_relative 'tag'
require_relative 'page/login'


Capybara.run_server = false 
Capybara.app_host = "https://www.instagram.com"
Capybara.current_driver = :cuprite
# Capybara.current_driver = :selenium_chrome

class Session
  attr_accessor :like_counter, :comment_counter, :tags, :like_tags, :user, :page

  def initialize(tag_names = [], user)
    @like_counter = 0
    @comment_counter = 0
    @tags = get_tags(tag_names)
    @user = user
    @page = Capybara::Session.new(Capybara.current_driver) 
    @page.driver.options[:js_errors] = false
    @page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:86.0) Gecko/20100101 #{['Safari', 'Firefox'].sample}/86.0" }
  end

  def login
    login_page = Page::Login.new(page, user)
    login_page.open
    login_page.accept_cookies
    login_page.fill_out
    login_page.submit
    # login_page.turn_off_notifications
  end

  def get_tags(names)
    if names.any?
      names
    else
      names << %w(tbt cute happy fashion followme me follow like4like selfie winter picoftheday summer friends instadaily girl fun repost love instagood photooftheday beautiful )
      names.flatten!
    end
    names.map { |name| Tag.new(self, name) }
  end

  def like_tags
    binding.pry
    tags.each do |tag|
      tag.like_posts(3)
    end
  end

  def comment_tags
    tags.each do |tag|
      tag.comment_posts(50)
    end
  end

  def get_hottest_tag_names
    websta_page.open
  end
end
