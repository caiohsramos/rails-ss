# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Subscriptions' do
  include_context 'with authorization request'

  describe 'POST /import' do
    let(:import_file) { fixture_file_upload('subscriptions.opml') }

    it 'calls Subscription with correct file' do
      subscription = double(import: double(success?: true))
      allow(Subscription).to receive(:new).and_return(subscription)
      expect(subscription).to receive(:import).with(having_attributes(original_filename: 'subscriptions.opml'))

      post '/subscriptions/import', params: { import_file: }
      expect(response).to redirect_to(root_path)
    end
  end
end
