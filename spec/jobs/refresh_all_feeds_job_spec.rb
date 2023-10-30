# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RefreshAllFeedsJob do
  describe '#perform' do
    before { create_list(:feed, 5) }

    it 'enqueues RefreshFeedJob five times' do
      described_class.new.perform
      expect(RefreshFeedJob).to have_been_enqueued.exactly(5).times
    end
  end
end
