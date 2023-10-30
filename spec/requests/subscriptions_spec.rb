# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Subscriptions' do
  describe 'POST /import' do
    it 'calls ImportSubscriptions with correct file' do
      import_file = fixture_file_upload('subscriptions.opml')
      expect(ImportSubscriptions).to receive(:call)
        .with(import_file: having_attributes(original_filename: 'subscriptions.opml'))
        .and_return(double(success?: true))
      post '/subscriptions/import', params: { import_file: }
    end
  end
end
