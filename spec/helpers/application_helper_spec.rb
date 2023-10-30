# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#all_read_form_path' do
    context 'when current selection is blank' do
      it 'returns correct path' do
        expect(helper.all_read_form_path(nil)).to eq(all_read_items_path)
      end
    end

    context 'when current selection is a Feed' do
      let(:feed) { create(:feed) }

      it 'returns correct path' do
        expect(helper.all_read_form_path(feed)).to eq(all_read_feed_items_path(feed))
      end
    end

    context 'when current selection is a Folder' do
      let(:folder) { create(:folder) }

      it 'returns correct path' do
        expect(helper.all_read_form_path(folder)).to eq(all_read_folder_items_path(folder))
      end
    end
  end
end
