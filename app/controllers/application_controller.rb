# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_sidebar_data, :set_settings

  def set_sidebar_data
    @sidebar_folders = Folder.all
    @sidebar_unfoldered_feeds = Feed.where(folder_id: nil)
    @sidebar_metrics = GetMetrics.call
  end

  def set_settings
    @settings = Setting.first_or_create
  end
end
