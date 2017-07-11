module Page
  class Login
    attr_reader :username, :password, :page

    def initialize(page, user)
      @page = page
      @username = user.username
      @password = user.password
    end

    def open
      page.visit '/'
      page.find('a', text: 'Log in').click
    end

    def fill_out
      page.fill_in 'username', with: username
      page.fill_in 'password', with: password
    end

    def submit
      page.find('button', text: 'Log in').trigger('click')
      puts 'logged in' unless page.has_selector?('Log in')
    end
  end
end
