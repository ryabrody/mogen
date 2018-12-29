require_relative '../comment'
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
      page.has_css?('button span[aria-label="Unlike"]')
    end

    def like
      heart = page.find('button span[aria-label="Like"][class*="Heart"]')
      heart.trigger('click')
    end

    def commented_by?(username)
      page.has_content?(username)
    end

    def comment
      text = comment_text
      textarea = page.find('textarea[placeholder="Add a comment…"]')

      # i do not know why
      textarea.set(text)
      textarea.set(text)

      textarea.native.send_keys :enter
    end

    private

    def comment_text
      Comment.new.text
    end
  end
end
