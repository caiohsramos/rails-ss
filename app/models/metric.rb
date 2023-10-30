# frozen_string_literal: true

class Metric
  include ActiveModel::Model

  attr_accessor :folders, :feeds, :all

  def for(item)
    case item
    when Folder
      folders.fetch(item.id, 0)
    when Feed
      feeds.fetch(item.id, 0)
    else
      0
    end
  end
end
