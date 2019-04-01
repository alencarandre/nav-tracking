namespace :navtracking do
  task fetch_sqs_messages: :environment do
    [0, 15, 30, 45].each do |i|
      SqsFetchMessageJob.perform_now
      # I don't know why yet, but sidekiq does not respect
      # the wait time, and if I perform_later, delay a lot
      sleep(i)
    end
  end
end
