# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Folder do
  describe 'associations' do
    it { is_expected.to have_many(:feeds).dependent(:nullify) }
    it { is_expected.to have_many(:items).through(:feeds) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end
end
