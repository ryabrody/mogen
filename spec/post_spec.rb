require 'spec_helper'
require_relative '../lib/post'

describe Post do
  let(:page) { Capybara::Session.new(::Capybara.current_driver) }
  let(:data) { { url: "#{Capybara.app_host}/unknown" } }
  let(:element) { capybara_node_element(page) }
  let(:subject) { Post.new(page, data) }
  let(:error) { capybara_poltergeist_status_fail_error }

  context '#like' do
    it 'runs without error' do
      allow_any_instance_of(Page::Post).to receive(:like).and_return(element)
      expect(subject.like).to be nil
    end

    it 'returns false when error on visit happens' do
      allow(page).to receive(:visit).and_raise(error)
      expect(subject.like).to be false
    end
  end
end
