module Support
  module Capybara
    # use this element to stub capybara elements
    # example:
    # allow(subject.page).to receive(:find).and_return(element)
    def capybara_node_element(page)
      base = ::Capybara::Poltergeist::Node.new(page.driver, 4, 6)
      ::Capybara::Node::Element.new(page, base, nil, nil)
    end

    # use this element to stub Capybara::Poltergeist::StatusFailError error
    # example:
    # allow(page).to receive(:visit).and_raise(error)
    def capybara_poltergeist_status_fail_error
      response = {
        'name' => 'Poltergeist.StatusFailError',
        'args' => [
          "#{::Capybara.app_host}/unknown",
          'Timed out with no open resource requests'
        ]
      }
      ::Capybara::Poltergeist::StatusFailError.new(response)
    end
  end
end
