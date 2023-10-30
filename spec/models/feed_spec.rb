# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feed do
  describe 'associations' do
    it { is_expected.to have_many(:items).dependent(:destroy) }
    it { is_expected.to belong_to(:folder).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:feed_link) }
  end
end
