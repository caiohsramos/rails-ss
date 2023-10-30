# frozen_string_literal: true

class GetMetrics
  include Interactor

  def call
    context.unread = unread_metrics
    context.starred = starred_metrics
  end

  private

  def unread_metrics
    Metric.new(folders: folders_unread_metric, feeds: feeds_unread_metric, all: all_unread_metric)
  end

  def starred_metrics
    Metric.new(folders: folders_starred_metric, feeds: feeds_starred_metric, all: all_starred_metric)
  end

  def all_unread_metric
    Item.unread.count
  end

  def all_starred_metric
    Item.starred.count
  end

  def feeds_unread_metric
    Item.unread.group(:feed_id).count
  end

  def feeds_starred_metric
    Item.starred.group(:feed_id).count
  end

  def folders_unread_metric
    Item.joins(:feed).unread.group('folder_id').count
  end

  def folders_starred_metric
    Item.joins(:feed).starred.group('folder_id').count
  end
end
