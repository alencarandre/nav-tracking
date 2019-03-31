namespace :navtracking do
  task fetch_sqs_messages: :environment do
    [0, 20, 40].each do |i|
      SqsFetchMessageJob.set(wait: i.to_i.seconds).perform_now
    end
  end
end
