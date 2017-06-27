require_relative 'base'

module Page
  class Post < Base
    attr_reader :path

    def initialize(path)
      @path = path
      super
    end

    def open
      page.visit(path)
    end

    def press_like
      page.find
    end

    def liked?
      page.has_link?('Unlike')
    end

    def like
      heart = page.find('a[role="button"]', text: 'Like')
      heart.click
    end
  end
end
