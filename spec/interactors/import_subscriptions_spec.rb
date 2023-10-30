# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportSubscriptions do
  it 'creates folders' do
    allow(CreateFeed).to receive(:call)
    expect do
      described_class.call(import_file: file_fixture('subscriptions.opml'))
    end.to change(Folder, :count).by(7)
  end

  it 'calls feed creation' do
    expect(CreateFeed).to receive(:call).exactly(40).times
    described_class.call(import_file: file_fixture('subscriptions.opml'))
  end
end
