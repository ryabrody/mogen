require 'spec_helper'
require_relative '../lib/tag'
require_relative '../lib/session'
require_relative '../lib/user'

describe Post do
  #let(:page) { Capybara::Session.new(::Capybara.current_driver) }
  #let(:data) { { url: "#{Capybara.app_host}/unknown" } }
  #let(:element) { capybara_node_element(page) }
  let(:tag_names) { %w{cute, happy} }
  let(:user) { User.new(username: 'Hans', password: 123445)}
  let(:session) { Session.new(tag_names, user) }
  let(:subject) { Tag.new(session, tag_names.first) }
  let(:error) { capybara_poltergeist_status_fail_error }

  context '#posts' do
    it 'runs without error' do
      expect(subject.posts(1)).to be_a(Array)
    end

    it 'returns false when error on visit happens' do
      allow_any_instance_of(Capybara::Session).to receive(:visit).and_raise(error)
      expect(subject.posts(1)).to eq []
    end
  end
end
