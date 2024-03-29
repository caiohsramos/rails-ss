# frozen_string_literal: true

class AuthorizedController < ApplicationController
  before_action :authorize

  before_action :set_settings
  helper_method :metric

  private

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

  def authorize
    return if session[:authorized]

    redirect_to new_session_path, alert: 'Not authorized'
  end
end
