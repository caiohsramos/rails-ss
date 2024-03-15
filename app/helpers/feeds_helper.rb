# frozen_string_literal: true

module FeedsHelper
  def feeds_refreshing?
    RefreshState.refreshing.exists?
  end
end
