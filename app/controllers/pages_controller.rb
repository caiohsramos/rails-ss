# frozen_string_literal: true

class PagesController < AuthorizedController
  def home
    @settings.update(selection: nil)
  end

  def hotkeys; end
end
