# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#render_badges?' do
    it 'returs true for starred' do
      expect(helper.render_badges?('starred')).to be(true)
    end

    it 'returs true for unread' do
      expect(helper.render_badges?('unread')).to be(true)
    end

    it 'returs false for all' do
      expect(helper.render_badges?('all')).to be(false)
    end
  end

  describe '#render_navigation_item?' do
    context 'when filter is all' do
      it 'returns true' do
        expect(helper.render_navigation_item?(nil, 'all', nil)).to be(true)
      end
    end

    context 'when filter is not all' do
      let(:folder) { create(:folder) }
      let(:feed) { create(:feed, folder:) }

      context 'with the current selection is the navigation_item' do
        it 'returns true' do
          expect(helper.render_navigation_item?(feed, feed, 'filter')).to be(true)
        end
      end

      context "with the current selection's folder is the navigation_item" do
        it 'returns true' do
          expect(helper.render_navigation_item?(folder, feed, 'filter')).to be(true)
        end
      end

      context 'without current selection relation' do
        it 'calls badge_for and returns false' do
          without_partial_double_verification do
            expect(helper).to receive(:metric).and_return(double(for: 0))
          end
          expect(helper.render_navigation_item?(nil, feed, 'filter')).to be(false)
        end

        it 'calls badge_for and returns true' do
          without_partial_double_verification do
            expect(helper).to receive(:metric).and_return(double(for: 1))
          end
          expect(helper.render_navigation_item?(nil, feed, 'filter')).to be(true)
        end
      end
    end
  end
end
