# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsHelper do
  describe 'current_items_path' do
    context 'when current selection is nil' do
      it 'returns correct path' do
        expect(helper.current_items_path(nil)).to eq(items_path)
      end
    end

    context 'when current selection is feed' do
      let(:feed) { create(:feed) }

      it 'returns correct path' do
        expect(helper.current_items_path(feed)).to eq(feed_items_path(feed))
      end
    end

    context 'when current selection is folder' do
      let(:folder) { create(:folder) }

      it 'returns correct path' do
        expect(helper.current_items_path(folder)).to eq(folder_items_path(folder))
      end
    end

    context 'when kwargs are sent' do
      it 'returns correct path' do
        expect(helper.current_items_path(nil, filter: 'filter')).to eq(items_path(filter: 'filter'))
      end
    end
  end
end
