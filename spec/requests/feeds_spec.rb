# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Feeds' do
  include_context 'with authorization request'

  describe 'GET index' do
    it 'renders index template' do
      get '/feeds'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:feed) { create(:feed) }

    it 'renders show template' do
      get "/feeds/#{feed.id}"
      expect(response).to render_template(:show)
    end
  end

  describe 'DELETE destroy' do
    let(:feed) { create(:feed) }

    it 'renders index template' do
      delete "/feeds/#{feed.id}"
      expect(response).to redirect_to(feeds_url)
    end

    it 'deletes the feed' do
      delete "/feeds/#{feed.id}"
      expect(Feed.count).to be_zero
    end
  end

  describe 'PUT update' do
    let(:feed) { create(:feed) }

    it 'renders index template' do
      put "/feeds/#{feed.id}", params: { feed: { title: 'my title' } }
      expect(response).to redirect_to(feeds_url)
    end

    it 'updates the feed' do
      put "/feeds/#{feed.id}", params: { feed: { title: 'my title' } }
      expect(feed.reload.title).to eq('my title')
    end
  end

  describe 'GET new' do
    it 'renders new template' do
      get '/feeds/new'
      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit' do
    let(:feed) { create(:feed) }

    it 'renders edit template' do
      get "/feeds/#{feed.id}/edit"
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST create' do
    let(:params) { { feed: { feed_link: 'feed_link' } } }

    it 'redirects to feeds_path' do
      expect(Feed).to receive(:build_with_remote_data).and_return(create(:feed))
      post('/feeds', params:)
      expect(response).to redirect_to(feeds_url)
    end

    context 'when create feed fails' do
      it 'renders new with 422' do
        expect(Feed).to receive(:build_with_remote_data).and_return(build(:feed, feed_link: nil))
        post('/feeds', params:)
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe 'GET icon' do
    let(:feed) { create(:feed, icon: 'icon') }

    it 'returns the icon' do
      get("/feeds/#{feed.id}/icon")
      expect(response.body).to eq('icon')
    end
  end

  describe 'GET unread_list' do
    let(:feed) { create_list(:feed, 3) }

    it 'returns the list' do
      get('/feeds/unread_list')
      expect(response).to render_template(:unread_list)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT refresh' do
    let(:feed) { create(:feed) }

    it 'calls refresh and redirect' do
      expect(RefreshAllFeedsJob).to receive(:perform_later)
      put('/feeds/refresh')
      expect(response).to redirect_to(root_url)
    end
  end
end
