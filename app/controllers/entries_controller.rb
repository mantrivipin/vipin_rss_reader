class EntriesController < ApplicationController

  def index
    @entries = Entry.where(feed_id: current_user.feeds.pluck(:id))
  end
end
