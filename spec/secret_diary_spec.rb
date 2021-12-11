require 'secret_diary'

describe SecretDiary do
  
  it '#lock locks the diary' do
    expect(subject.lock).to eq(true)
  end


end




# SecretDiary
#   - lock
#   - unlock
#   - add_entry
#   - get_entries

# Initially the `SecretDiary` class is locked, meaning `add_entry` and `get_entries` should throw an error.

# When the user calls `unlock`, `add_entry` and `get_entries` should work as desired.

# When the user locks the diary, by calling `lock`, `add_entry` and `get_entries` should, again, throw an error.