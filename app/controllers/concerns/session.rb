#セッションを作成してRedisにトークンを格納する
module Session

  def self.get(token)
    REDIS.hgetall(token)
  end
  def self.create(user)
    token = SecureRandom.hex(64)
    REDIS.mapped_hmset(
      token,
      'user_id' => user.id,
      'user_role' => user.role,
    )
    #Config/Settings.ymlに設定された時間をtokenのタイムアウトに設定する
    REDIS.expire(token, Settings.session.timeout)
    return token
  end
end
