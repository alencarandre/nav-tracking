Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 15
end

redis_server = ENV['REDISHOST'] || 'redis://localhost:6379/0'

Sidekiq.configure_server do |config|
  config.redis = {url: redis_server, network_timeout: 5}
end

Sidekiq.configure_client do |config|
  config.redis = {url: redis_server, network_timeout: 5}
end
