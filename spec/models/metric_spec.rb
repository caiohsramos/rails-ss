# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Metric do
  let(:folder) { create(:folder) }
  let(:feed) { create(:feed, folder:) }

  before do
    create_list(:item, 1, feed:, status: :unread)
    create_list(:item, 2, feed:, status: :starred)
    create_list(:item, 3, feed:, status: :read)
  end

  describe '#all' do
    it 'returns the count of all unread items' do
      metric = described_class.new(:unread)
      expect(metric.all).to eq(1)
    end

    it 'returns the count of all starred items' do
      metric = described_class.new(:starred)
      expect(metric.all).to eq(2)
    end
  end

  describe '#for' do
    context 'when metricable is a Folder' do
      it 'returns the count of unread items for the given folder' do
        metric = described_class.new(:unread)
        expect(metric.for(folder)).to eq(1)
      end

      it 'returns the count of starred items for the given folder' do
        metric = described_class.new(:starred)
        expect(metric.for(folder)).to eq(2)
      end
    end

    context 'when metricable is a Feed' do
      it 'returns the count of unread items for the given feed' do
        metric = described_class.new(:unread)
        expect(metric.for(feed)).to eq(1)
      end

      it 'returns the count of starred items for the given feed' do
        metric = described_class.new(:starred)
        expect(metric.for(feed)).to eq(2)
      end
    end

    context 'when metricable is neither a Folder nor a Feed' do
      it 'returns 0 for unread' do
        metric = described_class.new(:unread)
        expect(metric.for(nil)).to eq(0)
      end

      it 'returns 0 for starred' do
        metric = described_class.new(:starred)
        expect(metric.for(nil)).to eq(0)
      end
    end
  end
end
