class FeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = current_user.feeds.all
    update_subscribed_feeds
  end

  def show
  end

  def new
    @feed = current_user.feeds.build
  end

  def edit
  end

  def create
    @feed = current_user.feeds.build(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed was successfully created.' }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # whitelist parameters
    def feed_params
      params.require(:feed).permit(:name, :url, :description)
    end
    
    # run background job after index call
    def update_subscribed_feeds
      CreateFeedEntriesJob.perform_now
    end
end
