module Page
  class Base
    attr_reader :page

    def initialize(*)
      @page = Capybara.current_session

      # as soon as instagram.com does run 
      # a js errors uncmnt this:
      @page.driver.options[:js_errors] = false
    end
  end
end
