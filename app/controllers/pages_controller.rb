# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @settings.update(selection: nil)
  end

  def hotkeys; end
end
