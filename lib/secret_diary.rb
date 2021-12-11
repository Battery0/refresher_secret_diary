class SecretDiary

  def initialize
    @locked = true
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

end