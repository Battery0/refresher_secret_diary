require 'secret_diary'

describe SecretDiary do
  
  describe '#lock' do
    it 'locks the diary' do
      expect(subject.lock).to eq(true)
    end

  end

  describe '#unlock' do
    it 'unlocks the diary' do
      expect(subject.unlock).to eq(false)
    end
  end

  describe '#add_entry' do
    it 'allows the user to add a diary entry' do
      subject.unlock
      expect(subject.add_entry("I am a diary entry")).to eq(["I am a diary entry"])
    end

    it 'throws an error if trying to add an entry if the diary is locked' do
      expect { subject.add_entry("I am a diary entry") }.to raise_error("The diary is locked")
    end
  end

  describe '#get_entries' do
    it 'allows the user to see all diary entries' do
      subject.unlock
      subject.add_entry("entry 1")
      subject.add_entry("entry 2")
      subject.add_entry("entry 3")

      expect { subject.get_entries }.to output("entry 1\nentry 2\nentry 3\n").to_stdout
    end
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