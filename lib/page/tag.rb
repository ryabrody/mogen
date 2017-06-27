require_relative 'base'
#require_relative 'post'

module Page
  class Tag < Base
    NUM_POSTS_FIRST_PAGE = 21

    attr_reader :tag

    def initialize(tag)
      @tag = tag
      super
    end

    def open
      page.visit("tags/#{tag}/")
    end

    def load_max(num)
      begin Capybara::ElementNotFound
        page.find('a', text: 'Load more').click
      rescue
        return
      end
      puts posts_num
      loop.with_index do |_, i|
        page.execute_script 'window.scrollBy(0,5000)'
        puts posts_num
        break if posts_num > num || i > 10 * num
      end
    end

    def posts_urls
      page.all("a[href$='/?tagged=#{tag}']")
    end

    private

    def posts_num
      posts_urls.size
    end
  end
end
