require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'pry'
require 'dotenv'
require_relative 'tag'
require_relative 'page/login'

Dotenv.load

Capybara.run_server = false
Capybara.app_host = "https://www.instagram.com"
Capybara.current_driver = :poltergeist

class Session
  attr_accessor :like_counter, :tags, :like_tags

  def initialize(tag_names = [])
    @like_counter = 0
    @tags = get_tags(tag_names)
  end

  def login
    login_page = Page::Login.new
    login_page.open
    login_page.fill_out
    login_page.submit
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
    tags.each do |tag|
      tag.like_posts(60)
    end
  end

  def get_hottest_tag_names
    websta_page.open

  end
end
