class SqsFetchMessageJob < ApplicationJob
  queue_as :default

  def perform
    client.get_trackings.each do |message|
      Tracking.where(
        guid: message[:guid],
        location: message[:location],
        accessed_at: Time.at(message[:accessed_at]).to_datetime
      ).first_or_create!

      client.unqueue_tracking(message[:receipt_handle])
    end
  end

  private

  def client
    @client ||= NavTracking::Client.new
  end
end
