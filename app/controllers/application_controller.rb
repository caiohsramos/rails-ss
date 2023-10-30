# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_sidebar_data, :set_current_selection, :set_current_filter

  def set_sidebar_data
    @sidebar_folders = Folder.all
    @sidebar_unfoldered_feeds = Feed.where(folder_id: nil)
    @sidebar_metrics = GetMetrics.call
  end

  def set_current_filter
    @current_filter = session[:current_filter] || 'all'
  end

  def set_current_selection
    return if session[:current_selection_type].blank?

    @current_selection = session[:current_selection_type].constantize.find_by(id: session[:current_selection_id])
  end
end
