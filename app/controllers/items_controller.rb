# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: [:update]
  skip_before_action :set_sidebar_data, only: [:update]

  def index
    params.with_defaults!(filter: 'all')
    filtered_items = scoped_items.with_filter(params[:filter])
    filtered_items = filtered_items.search(params[:q]) if params[:q].present?

    @pagy, @items = pagy_countless(filtered_items, items: 30)
  end

  def update
    if @item.update(item_params)
      set_sidebar_data
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to feed_path(@item.feed) }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def all_read
    scoped_items.unread.update_all(status: :read) # rubocop:disable Rails/SkipsModelValidations
    redirect_back_or_to root_path
  end

  private

  def scoped_items
    if params[:feed_id].present?
      Item.where(feed_id: params[:feed_id])
    elsif params[:folder_id].present?
      Item.joins(:feed).where(feed: { folder_id: params[:folder_id] })
    else
      Item
    end.order(date: :desc)
  end

  def item_params
    params.require(:item).permit(:status)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
