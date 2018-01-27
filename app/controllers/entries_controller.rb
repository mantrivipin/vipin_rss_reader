class EntriesController < ApplicationController

  def index
    @entries = Entry.where(feed_id: current_user.feeds.pluck(:id))
                    .order('published_at desc')
  end
end
