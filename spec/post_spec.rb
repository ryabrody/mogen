require 'spec_helper'
require_relative '../lib/post'

describe Post do
  let(:path) { '/beautifull' }
  let(:page) { Capybara::Session.new(Capybara.current_driver) }
  let(:data) do
    { url: "#{Capybara.app_host}#{path}" }
  end
  let(:subject) { Post.new(page, data) }

  # TODO stub page

  context '#like' do
    it 'likes a post' do
      expect(subject.like).to be true
    end

    context 'error on visit post happens' do
      let(:response) do
        {
          'name' => 'Poltergeist.StatusFailError',
          'args' => [
            "#{Capybara.app_host}#{path}",
            'Timed out with no open resource requests'
          ]
        }
      end
      let(:error) { Capybara::Poltergeist::StatusFailError.new(response) }

      before :each do
        allow(page).to receive(:visit).and_raise(error)
      end

      it 'returns false' do
        expect(subject.like).to be false
      end
    end
  end
end
