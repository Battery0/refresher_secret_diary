class SecretDiary

  def initialize
    @locked = true
    @diary_entries = []
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def add_entry(user_entry)
    @diary_entries << user_entry
  end

end