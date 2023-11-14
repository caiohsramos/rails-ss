# frozen_string_literal: true

module ItemsHelper
  def current_items_path(current_selection, **)
    polymorphic_path([current_selection, :items], **)
  end
end
