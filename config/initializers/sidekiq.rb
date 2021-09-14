redisHost = ENV["REDIS_HOST"].nil? ? "redis://localhost:6379" : ENV["REDIS_HOST"]
Sidekiq.configure_client do |config|
  config.redis = { url: redisHost }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redisHost }
end