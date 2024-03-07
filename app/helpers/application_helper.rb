# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def current_path(current_selection, **)
    return root_path(**) if current_selection.blank?

    polymorphic_path(current_selection, **)
  end

  def hotkey_actions # rubocop:disable Metrics/MethodLength
    [
      'keydown.1->hotkeys#selectAll',
      'keydown.2->hotkeys#selectUnread',
      'keydown.3->hotkeys#selectStarred',
      'keydown.shift+r->hotkeys#readAll',
      'keydown.f->hotkeys#scrollContentDown',
      'keydown.b->hotkeys#scrollContentUp',
      'keydown.h->hotkeys#previousFeed',
      'keydown.l->hotkeys#nextFeed',
      'keydown.j->hotkeys#nextItem',
      'keydown.k->hotkeys#previousItem',
      'keydown.t->hotkeys#toggleItem',
      'keydown.r->hotkeys#toggleRead',
      'keydown.s->hotkeys#toggleStarred',
      'keydown.o->hotkeys#openLink',
      'keydown.slash->hotkeys#focusSearch'
    ].join(' ')
  end

  def items_actions
    [
      'hotkeys:nextItem@window->items#highlightNext',
      'hotkeys:previousItem@window->items#highlightPrevious',
      'hotkeys:toggleItem@window->items#toggleCurrent',
      'hotkeys:openLink@window->items#openCurrent',
      'hotkeys:toggleRead@window->items#toggleReadCurrent',
      'hotkeys:toggleStarred@window->items#toggleStarredCurrent'
    ].join(' ')
  end

  def render_badges?(current_filter)
    current_filter.in?(%w[starred unread])
  end

  def render_navigation_item?(navigation_item, metrics, current_selection, current_filter)
    return true if current_filter == 'all'
    return true if current_selection == navigation_item || current_selection.try(:folder) == navigation_item

    !badge_for(navigation_item, metrics, current_filter).zero?
  end

  def badge_for(navigation_item, metrics, current_filter)
    metrics.send(current_filter).for(navigation_item)
  end
end
