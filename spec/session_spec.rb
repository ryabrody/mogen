require 'spec_helper'
require_relative '../lib/user'
require_relative '../lib/session'

describe Session do
  let(:element) { capybara_node_element(subject.page) }
  let(:tag_names) { %w{cute, happy} }
  let(:user) { User.new(username: 'Hans', password: 123445)}
  let(:subject) { Session.new(tag_names, user) }
  let(:error) { capybara_poltergeist_status_fail_error }

  context '#login' do
    it 'runs without error' do
      expect(subject.login).to be nil
    end

    it 'does not raise an error when Capybara::Poltergeist::StatusFailError happens on visit' do
      allow(subject.page).to receive(:visit).and_raise(error)
      allow(subject.page).to receive(:find).and_return(element)

      allow(element).to receive(:click).and_return(element)
      allow(subject.page).to receive(:fill_in).and_return(element)
      allow(element).to receive(:trigger).and_return(element)

      expect(subject.login).to be nil
    end
  end
end
