# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateFeed do
  subject(:context) { described_class.call(feed_link:) }

  let(:feed_link) { Faker::Internet.url }

  before do
    allow(RefreshFeedJob).to receive(:perform_now)
    allow(RemoteFeed).to receive(:from_link).and_return(double(title: 'title',
                                                               description: 'description',
                                                               link: 'link'))
  end

  describe '.call' do
    context 'with correct params' do
      it 'creates new feed' do
        expect { context }.to change(Feed, :count).by(1)
      end
    end

    context 'with incomplete params' do
      let(:feed_link) { nil }

      it 'does not create feed' do
        expect { context }.not_to change(Feed, :count)
      end
    end
  end
end
