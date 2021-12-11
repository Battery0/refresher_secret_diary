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
    locked_error
    @diary_entries << user_entry
  end

  def get_entries
    locked_error
    @diary_entries.each { |entry| puts entry }
  end

  private

  def locked_error
    raise "The diary is locked" if @locked == true
  end

end