# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def all_read_form_path(current_selection)
    case current_selection
    when Feed
      all_read_feed_items_path(current_selection)
    when Folder
      all_read_folder_items_path(current_selection)
    else
      all_read_items_path
    end
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
      'keydown.o->hotkeys#openLink'
    ].join(' ')
  end
end
