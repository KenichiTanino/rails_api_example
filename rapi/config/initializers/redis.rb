# frozen_string_literal: true
# require 'connection_pool'

redis_config = RedisClient.config(url: (ENV['REDIS_URL']).to_s)
RedisObj = redis_config.new_pool(timeout: 2.0, size: Integer(ENV.fetch('RAILS_MAX_THREADS', 5)))

# Redis::Objects.redis = RedisClient.config(url: (ENV['REDIS_URL']).to_s)
# Redis::Objects.redis.new_pool(timeout: 2.0, size: Integer(ENV.fetch('RAILS_MAX_THREADS', 5)))
# Redis::Objects.redis = ConnectionPool.new(size: Integer(ENV.fetch('RAILS_MAX_THREADS', 5)), timeout: 5) { RedisClient.config(url: (ENV['REDIS_URL']).to_s) }
# RedisObj = ConnectionPool.new(size: Integer(ENV.fetch('RAILS_MAX_THREADS', 5)), timeout: 5) { RedisClient.config(url: (ENV['REDIS_URL']).to_s) }
