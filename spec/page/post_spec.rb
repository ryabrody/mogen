require 'spec_helper'
require_relative '../../lib/page/post'

describe Page::Post do
  let(:path) { '/beautifull' }
  let(:page) { Capybara::Session.new(Capybara.current_driver) }
  lel(:data) do
    { url: "#{Capybara.app_host}#{path}" }
  end
  let(:subject) { Page::Post.new(page, path) }

  it 'likes a post' do
    expect(post.like).to be_true
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

    it 'retries visiting the post page when error occurs' do
      expect(post.like).to be_false
    end
  end
end
