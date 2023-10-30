# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Settings' do
  describe 'PUT /settings' do
    it 'returns http success' do
      put '/settings', params: { settings: { current_filter: 'unread' } }
      expect(response).to have_http_status(:found)
    end

    it 'persists to session' do
      put '/settings', params: { settings: { current_filter: 'unread' } }
      expect(session[:current_filter]).to eq('unread')
    end
  end
end
