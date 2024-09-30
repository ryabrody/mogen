module Page
  class Tag
    NUM_POSTS_FIRST_PAGE = 45

    attr_reader :page, :tag

    def initialize(page, tag)
      @page = page
      @tag = tag
    end

    def open
      page.visit("explore/tags/#{tag}/")
    end

    def load_max_urls(num)
      post_urls = live_posts_urls.to_a
      times_to_load_12_more = (num - NUM_POSTS_FIRST_PAGE) / 12
      times_to_load_12_more.times do  |i|
        page.execute_script 'window.scrollBy(0,10000)'
        post_urls << live_posts_urls.to_a
        puts "loaded additionally #{i + 1} of #{times_to_load_12_more} pages"
      end
      post_urls.flatten.uniq
    end

    def live_posts_urls
      a_tags = page.all('a[href^="/p/"]')
      a_tags.map do |a_tag|
        a_tag[:href]
      end
    end

    private

    def posts_num
      live_posts_urls.size
    end
  end
end
