# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Setting do
  subject { create(:setting) }

  describe 'associations' do
    it { is_expected.to belong_to(:selection).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_inclusion_of(:filter).in_array(%w[all unread starred]) }
  end
end
