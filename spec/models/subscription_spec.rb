# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscription do
  describe '#import' do
    context 'when the import is successful' do
      before { allow(Feed).to receive(:build_with_remote_data) { build(:feed) } }

      it 'returns a success result' do
        result = described_class.new.import(file_fixture('subscriptions.opml'))

        expect(result.success?).to be true
      end

      it 'creates folders' do
        expect do
          described_class.new.import(file_fixture('subscriptions.opml'))
        end.to change(Folder, :count).by(7)
      end

      it 'creates feeds' do
        expect do
          described_class.new.import(file_fixture('subscriptions.opml'))
        end.to change(Feed, :count).by(40)
      end
    end

    context 'when the import fails' do
      let(:file) { double('file') }

      before { allow(file).to receive(:read).and_raise(StandardError) }

      it 'returns a failure result' do
        result = described_class.new.import(file)

        expect(result.success?).to be false
      end

      it 'does not create folders' do
        expect do
          described_class.new.import(file)
        end.not_to change(Folder, :count)
      end

      it 'does not create feeds' do
        expect do
          described_class.new.import(file)
        end.not_to change(Feed, :count)
      end
    end
  end
end
