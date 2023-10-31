# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Settings' do
  describe 'PUT /settings' do
    let!(:settings) { create(:setting) }

    it 'updates the database' do
      put '/settings', params: { settings: { filter: 'unread' } }
      expect(settings.reload.filter).to eq('unread')
    end
  end
end
