# frozen_string_literal: true

module FeedsHelper
  def render_badges?(current_filter)
    current_filter.in?(%w[starred unread])
  end

  def render_list_item?(list_item, metrics, current_selection, current_filter)
    return true if current_filter == 'all'
    return true if current_selection == list_item || current_selection.try(:folder) == list_item

    !badge_for(list_item, metrics, current_filter).zero?
  end

  def badge_for(list_item, metrics, current_filter)
    metrics.send(current_filter).for(list_item)
  end
end
