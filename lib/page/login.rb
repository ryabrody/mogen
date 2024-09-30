module Page
  class Login
    attr_reader :username, :password, :page

    def initialize(page, user)
      @page = page
      @username = user.username
      @password = user.password
    end

    def open
      # begin
      #   tries ||= 10
      #   page.visit '/login/'
      #   binding.pry
      # rescue Capybara::Poltergeist::StatusFailError
      #   puts "Login #{username} failed will retry now. Retries left: #{tries} times"
      #   retry unless (tries -= 1).zero?
      # end
      # page.find_button('Log in')
      # TODO go on here find out how to open instagram
      page.visit Capybara.app_host
    end

    def fill_out
      page.fill_in 'username', with: username
      page.fill_in 'password', with: password
    end

    def accept_cookies
      page.find_button('Allow all cookies').trigger('click')
      puts 'Cookies accepted'
    end

    def submit
      page.find('button[type="submit"]').trigger('click')
      # page.find('button div', text: 'Log In', match: :first).click
      # page.find('button div', text: 'Log In', match: :first).click
      # page.visit '/'
      #sleep 5
      #page.find('button', text: "Not Now").trigger('click')

      #page.find("a[href='/#{username}/']", match: :first)

      # page.find('div[role="button"]', text: "Not now").trigger('click')
      sleep 5
      page.find('button', text: 'Save info').trigger('click')
      puts 'logged in'
      sleep 5
    end

    def turn_off_notifications
    rescue Capybara::ElementNotFound
      page.find('button', text: 'Not Now', match: :first).click
      puts 'turned off notification'
    end
  end
end
