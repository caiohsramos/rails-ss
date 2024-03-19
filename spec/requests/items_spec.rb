# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items' do
  include_context 'with authorization request'

  describe 'GET /items' do
    %i[all unread starred].each do |filter|
      it "renders index template with #{filter} filter" do
        get "/items?filter=#{filter}"
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET /feeds/:feed_id/items/' do
    let(:feed) { create(:feed) }

    before { create(:item, feed:) }

    %i[all unread starred].each do |filter|
      it "renders index template with #{filter} filter and feed_id" do
        get "/feeds/#{feed.id}/items?filter=#{filter}"
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'PUT /items/:id' do
    let(:item) { create(:item) }

    it 'updates the item' do
      put "/items/#{item.id}", params: { item: { status: 'read' } }
      expect(item.reload.status).to eq('read')
    end

    it 'returns http ok' do
      put "/items/#{item.id}", params: { item: { status: 'read' } }
      expect(response).to have_http_status(:found)
    end

    it 'redirects to feed_path' do
      put "/items/#{item.id}", params: { item: { status: 'read' } }
      expect(response).to redirect_to(feed_path(item.feed))
    end

    it 'return a turbo stream response' do
      put "/items/#{item.id}", params: { item: { status: 'read' } }, as: :turbo_stream
      expect(response.media_type).to eq Mime[:turbo_stream]
    end
  end

  describe 'PUT /items/current_read' do
    before { create_list(:item, 3) }

    it 'updates the items' do
      put '/items/current_read'
      expect(Item.all.map(&:status)).to eq(%w[read read read])
    end

    it 'returns http found' do
      put '/items/current_read'
      expect(response).to have_http_status(:found)
    end

    it 'redirects to root_path' do
      put '/items/current_read'
      expect(response).to redirect_to(root_path)
    end

    context 'with settings selected' do
      before { Setting.first_or_create(selection: feed) }

      let(:feed) { Feed.first }

      it 'updates the items' do
        put '/items/current_read'
        expect(Item.all.map(&:status)).to eq(%w[read unread unread])
      end

      it 'returns http found' do
        put '/items/current_read'
        expect(response).to have_http_status(:found)
      end

      it 'redirects to root_path' do
        put '/items/current_read'
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
