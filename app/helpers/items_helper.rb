# frozen_string_literal: true

module ItemsHelper
  def current_items_path(current_selection, **)
    case current_selection
    when Feed
      feed_items_path(current_selection, **)
    when Folder
      folder_items_path(current_selection, **)
    else
      items_path(**)
    end
  end
end
