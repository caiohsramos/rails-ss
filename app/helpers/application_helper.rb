# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def all_read_form_path(current_selection)
    polymorphic_path([:all_read, current_selection, :items])
  end

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

  def content_actions
    [
      'hotkeys:nextItem@window->content#highlightNext',
      'hotkeys:previousItem@window->content#highlightPrevious',
      'hotkeys:toggleItem@window->content#toggleCurrent',
      'hotkeys:openLink@window->content#openCurrent',
      'hotkeys:toggleRead@window->content#toggleReadCurrent',
      'hotkeys:toggleStarred@window->content#toggleStarredCurrent'
    ].join(' ')
  end
end
