# frozen_string_literal: true

class Metric
  def initialize(filter)
    @filter = filter
  end

  attr_accessor :filter

  def all
    send(:"all_#{filter}")
  end

  def for(metricable)
    case metricable
    when Folder
      folders.fetch(metricable.id, 0)
    when Feed
      feeds.fetch(metricable.id, 0)
    else
      0
    end
  end

  private

  def folders
    @folders ||= send(:"folders_#{filter}")
  end

  def feeds
    @feeds ||= send(:"feeds_#{filter}")
  end

  def all_unread
    Item.unread.count
  end

  def all_starred
    Item.starred.count
  end

  def feeds_unread
    Item.unread.group(:feed_id).count
  end

  def feeds_starred
    Item.starred.group(:feed_id).count
  end

  def folders_unread
    Item.joins(:feed).unread.group('folder_id').count
  end

  def folders_starred
    Item.joins(:feed).starred.group('folder_id').count
  end
end
