Sidekiq.configure_server do |config|
  config.average_scheduled_poll_interval = 15
end
# 
# Sidekiq.configure_server do |config|
#   config.redis = {url: 'redis://localhost:6379/0', network_timeout: 5}
# end
#
# Sidekiq.configure_client do |config|
#   config.redis = {url: 'redis://localhost:6379/0', network_timeout: 5}
# end
