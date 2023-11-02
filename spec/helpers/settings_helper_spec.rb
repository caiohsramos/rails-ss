# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SettingsHelper do
  describe '#filter_options' do
    it 'returns options array' do
      expect(helper.filter_options).to eq([%w[All all], %w[Unread unread], %w[Starred starred]])
    end
  end
end
