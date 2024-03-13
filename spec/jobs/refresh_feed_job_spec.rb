# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RefreshFeedJob do
  describe '#perform' do
    subject(:perform) { described_class.new.perform(feed.id) }

    before do
      allow(RemoteFeed).to receive(:from_link).and_return(
        double(title: 'title', description: 'description', link: 'link', items:)
      )
    end

    let(:items) do
      [double(
        guid: 'guid1',
        title: 'title',
        link: 'link',
        description: 'description',
        content: 'content',
        author: 'author',
        date: 'date',
        image: 'image',
        podcast_url: 'podcast_url'
      ),
       double(
         guid: 'guid2',
         title: 'title',
         link: 'link',
         description: 'description',
         content: 'content',
         author: 'author',
         date: 'date',
         image: 'image',
         podcast_url: 'podcast_url'
       )]
    end

    let(:feed) { create(:feed) }
    let(:feed_link) { feed.feed_link }
    let(:refresh_state) { feed.refresh_state }

    it 'creates items' do
      expect { perform }.to change(Item, :count).by(2)
    end

    it 'updates refresh state' do
      expect(Turbo::StreamsChannel).to receive(:broadcast_refresh_to).with(:refresh_states)
      expect do
        perform
        refresh_state.reload
      end.to change(refresh_state, :refreshed_at)
    end
  end
end
