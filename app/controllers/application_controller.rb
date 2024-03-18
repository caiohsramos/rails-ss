# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_settings
  helper_method :metric

  def set_sidebar_data
    @sidebar_folders = Folder.includes(feeds: :refresh_state).all
    @sidebar_unfoldered_feeds = Feed.includes(:refresh_state).where(folder_id: nil)
  end

  def set_settings
    @settings = Setting.first_or_create
  end

  def metric
    @metric ||= Metric.new(@settings.filter)
  end
end
