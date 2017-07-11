module Page
  class Post
    attr_reader :page, :path

    def initialize(page, path)
      @page = page
      @path = path
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
