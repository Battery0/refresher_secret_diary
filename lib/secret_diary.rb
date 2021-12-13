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
    raise "The diary is locked" if @locked == true
    @diary_entries << user_entry
  end

  def get_entries(entries = SecretDiaryPrinter.new)
    locked_error
    entries.print_all(@diary_entries)
  end

  private

  def locked_error
    raise "The diary is locked" if @locked == true
  end

end