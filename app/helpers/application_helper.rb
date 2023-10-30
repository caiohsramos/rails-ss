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
end
