class TrackingsController < ApplicationController
  def index
    @trackings = Tracking.order_accessed_at_desc.limit(50)
  end
end
