# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RefreshAllFeedsJob do
  describe '#perform' do
    before { create_list(:feed, 5) }

    it 'enqueues RefreshFeedJob five times' do
      expect(RefreshFeedJob).to receive(:perform_later).exactly(5).times
      described_class.new.perform
    end
  end
end
