require 'secret_diary'

describe SecretDiary do

  it 'a user can unlock the diary, add entries, lock it, and then come back later to unlock it and read all their entries' do
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
    expect { subject.get_entries }.to output("entry 1\nentry 2\nentry 3\n").to_stdout
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