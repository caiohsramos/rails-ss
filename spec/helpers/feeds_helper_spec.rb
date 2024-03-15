# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedsHelper do
  describe '#feeds_refreshing?' do
    context 'when there are refreshing feeds' do
      it 'returns true' do
        create(:refresh_state, state: :refreshing)

        expect(helper).to be_feeds_refreshing
      end
    end

    context 'when there are no refreshing feeds' do
      it 'returns false' do
        create(:refresh_state)
        expect(helper).not_to be_feeds_refreshing
      end
    end
  end
end
