require 'spec_helper'
require_relative '../../lib/page/post'

describe Page::Post do
  let(:path) { '/beautifull-example-page' }
  let(:page) { Capybara::Session.new(Capybara.current_driver) }
  let(:subject) { Page::Post.new(page, path) }

  it 'visits the post page' do
    expect(subject.open).to eq('status' => 'success')
  end

  context 'error on visit happens' do
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
      subject.open
      expect(page).to have_received(:visit).thrice
    end
  end
end
