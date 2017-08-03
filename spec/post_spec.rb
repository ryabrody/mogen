require 'spec_helper'
require_relative '../lib/post'

describe Post do
  let(:path) { '/beautifull' }
  let(:page) { Capybara::Session.new(Capybara.current_driver) }
  let(:data) do
    { url: "#{Capybara.app_host}#{path}" }
  end
  let(:subject) { Post.new(page, data) }

  let(:base) { Capybara::Poltergeist::Node.new(page.driver, 4, 6) } 
  let(:element) { Capybara::Node::Element.new(page, base, nil, nil) }

  before :each do
    allow_any_instance_of(Page::Post).to receive(:like).and_return(element)
  end

  context '#like' do
    it 'runs without error' do
      expect(subject.like).to be nil
    end

    context 'when error on visit happens' do
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
