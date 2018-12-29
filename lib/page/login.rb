module Page
  class Login
    attr_reader :username, :password, :page

    def initialize(page, user)
      @page = page
      @username = user.username
      @password = user.password
    end

    def open
      begin
        tries ||= 10
        page.visit '/accounts/login/'
      rescue Capybara::Poltergeist::StatusFailError
        puts "Login #{username} failed will retry now. Retries left: #{tries} times"
        retry unless (tries -= 1).zero?
      end
      page.find('button', text: 'Log in', match: :first)
    end

    def fill_out
      page.fill_in 'username', with: username
      page.fill_in 'password', with: password
    end

    def submit
      page.find('button', text: 'Log in', match: :first).click
      puts 'logged in' unless page.has_selector?('Log in')
    end

    def turn_off_notifications
    rescue Capybara::ElementNotFound
      page.find('button', text: 'Not Now', match: :first).click
      puts 'turned off notification'
    end
  end
end
