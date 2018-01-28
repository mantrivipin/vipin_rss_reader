class EntriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @entries = Entry.where(feed_id: current_user.feeds.pluck(:id))
                    .order('published_at desc').paginate(page: params[:page], per_page: 15)
  end
end
