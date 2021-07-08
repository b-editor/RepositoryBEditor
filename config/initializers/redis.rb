require 'redis'

if Rails.env.test?
  REDIS = MockRedis.new
else
  if ENV["REDIS_HOST"] && ENV["REDIS_PORT"]
    host = URI.parse(ENV["REDIS_HOST"]).to_s
    port = URI.parse(ENV["REDIS_PORT"]).to_s
    REDIS = Redis.new(host: host, port: port)
  end
end
