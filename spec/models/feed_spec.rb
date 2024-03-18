# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Feed do
  describe 'associations' do
    it { is_expected.to have_many(:items).dependent(:destroy) }
    it { is_expected.to belong_to(:folder).optional }
    it { is_expected.to have_one(:refresh_state).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:feed_link) }
  end

  describe '.build_with_remote_data' do
    before do
      allow(RemoteFeed).to receive(:from_link).with(feed_link).and_return(double(title: 'title',
                                                                                 description: 'description',
                                                                                 link: 'link',
                                                                                 icon: 'icon'))
    end

    let(:feed_link) { Faker::Internet.url }

    it 'returns a new feed with remote data' do # rubocop:disable RSpec/ExampleLength
      feed = described_class.build_with_remote_data(feed_link:)

      expect(feed).to be_new_record
      expect(feed.title).to eq('title')
      expect(feed.description).to eq('description')
      expect(feed.link).to eq('link')
      expect(feed.icon).to eq('icon')
    end
  end
end
