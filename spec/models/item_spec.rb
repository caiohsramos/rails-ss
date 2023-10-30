# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item do
  subject { create(:item) }

  describe 'associations' do
    it { is_expected.to belong_to(:feed) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:guid) }
    it { is_expected.to validate_uniqueness_of(:guid).scoped_to(:feed_id) }
  end

  describe 'enums' do
    it {
      is_expected.to define_enum_for(:status).backed_by_column_of_type(:string).with_values({ unread: 'unread',
                                                                                              read: 'read',
                                                                                              starred: 'starred' })
    }
  end
end
