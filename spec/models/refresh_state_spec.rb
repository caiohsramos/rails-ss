# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RefreshState do
  subject { create(:refresh_state) }

  describe 'associations' do
    it { is_expected.to belong_to(:feed) }
  end

  describe 'aasm' do
    let(:refresh_state) { subject }

    it 'clears error on start' do
      refresh_state.update(error: 'error')
      refresh_state.start!
      expect(refresh_state.error).to be_nil
      expect(refresh_state).to have_state(:refreshing)
    end

    context 'when error is empty' do
      before { refresh_state.start! }

      it 'transitions to success on finish' do
        refresh_state.finish!
        expect(refresh_state).to have_state(:success)
      end
    end

    context 'when error is not empty' do
      before { refresh_state.start! }

      it 'checks error on finish' do
        refresh_state.update(error: 'error')
        refresh_state.finish!
        expect(refresh_state).to have_state(:error)
      end
    end
  end
end
