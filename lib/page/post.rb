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
      true
    rescue StandardError, AnotherError => e
      puts "Could not open page: #{e.inspect}"
      false
    end

    def press_like
      page.find
    end

    def liked?
      page.has_css?('button svg[aria-label="Unlike"][height="24"]')
    rescue StandardError, AnotherError => e
      puts "Could not find a liked heart: #{e.inspect}"
      true # We skip this tag with assuming it was alredy liked
    end

    def like
      heart = page.find('button svg[aria-label="Like"][height="24"]')
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
