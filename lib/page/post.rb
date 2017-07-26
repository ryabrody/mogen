module Page
  class Post
    attr_reader :page, :path

    def initialize(page, path)
      @page = page
      @path = path
    end

    def open
      page.visit(path)
    rescue Capybara::Poltergeist::StatusFailError
      retry_open
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

    def retry_open
      if @retried_count
        @retried_count = @retried_count + 1
      else
        @retried_count = 1
      end
      if @retried_count <= 2
        puts "Retry visit post #{path}"
        open
      else
        puts "Coulud not visit post #{path}"
      end
    end
  end
end
