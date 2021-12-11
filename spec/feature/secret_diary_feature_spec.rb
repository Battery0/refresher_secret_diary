require 'secret_diary'

describe SecretDiary do

  it 'a user can unlock the diary, add entries and then lock it' do
    subject.unlock
    subject.add_entry("entry 1")
    subject.add_entry("entry 2")
    subject.add_entry("entry 3")
    subject.lock
  end

  it 'a user can unlock the diary, add entries, lock it, and then come back later to unlock it and ead all their entries' do
    subject.unlock
    subject.add_entry("entry 1")
    subject.lock
    subject.unlock
    subject.add_entry("entry 2")
    subject.lock
    subject.unlock
    subject.add_entry("entry 3")
    subject.lock
    subject.unlock
    subject.get_entries
  end

  it 'so that no one can read the secret diary without unlocking it, an error should be thrown if trying to read the diary without unloclking it first' do
    subject.unlock
    subject.add_entry("entry 1")
    subject.add_entry("entry 2")
    subject.add_entry("entry 3")
    subject.lock
    expect { subject.get_entries }.to raise_error("The diary is locked")
  end
end