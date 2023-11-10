# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RemoteFeed do
  describe '.from_link' do
    it 'parses feed and returns', :vcr do
      result = described_class.from_link('https://caioramos.dev/feed.xml')
      expect(result).to be_instance_of(described_class)
      expect(result.link).to eq('https://caioramos.dev/')
      expect(result.icon).not_to be_blank
      expect(result.items.count).to eq(5)
    end
  end

  describe '.empty' do
    it 'returns empty field' do
      result = described_class.empty
      expect(result).to be_instance_of(described_class)
      expect(result.items).to eq([])
    end
  end
end
