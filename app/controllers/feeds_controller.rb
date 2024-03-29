# frozen_string_literal: true

class FeedsController < AuthorizedController
  before_action :set_feed, only: %i[show edit update destroy icon]
  before_action :set_sidebar_data, only: [:unread_list]

  # GET /feeds
  def index
    @feeds = Feed.all
  end

  # GET /feeds/1
  def show
    @settings.update(selection: @feed)
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit; end

  # POST /feeds
  def create
    @feed = Feed.build_with_remote_data(feed_params)

    if @feed.save
      redirect_to feeds_path, notice: 'Feed was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feeds/1
  def update
    if @feed.update(feed_params)
      redirect_to feeds_url, notice: 'Feed was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy!

    redirect_to feeds_url, notice: 'Feed was successfully destroyed.'
  end

  def refresh
    RefreshAllFeedsJob.perform_later
    redirect_back_or_to root_path, notice: 'Feeds refreshing.'
  end

  def icon
    send_data @feed.icon, type: 'image/png', disposition: 'inline'
  end

  def unread_list; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_feed
    @feed = Feed.find(params[:id] || params[:feed_id])
  end

  # Only allow a list of trusted parameters through.
  def feed_params
    params.require(:feed).permit(:title, :description, :link, :feed_link, :folder_id)
  end
end
