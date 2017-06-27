require_relative 'base'
#require_relative 'page/base'

module Page
  class Login < Base
    def open
      page.visit '/'
      page.find('a', text: 'Log in').click
    end

    def fill_out
      page.fill_in 'username', with: ENV['USERNAME']
      page.fill_in 'password', with: ENV['PASSWORD']
    end

    def submit
      page.find('button', text: 'Log in').trigger('click')
      puts 'logged in' unless page.has_selector?('Log in')
    end
  end
end
