require 'secret_diary'

describe SecretDiary do
  # let(:secret_diary_printer_dbl) { double(:secret_diary_printer_dbl, { print_all: "entry 1\nentry 2\nentry 3\n"  } )}
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
      secret_diary_printer_dbl = double(:secret_diary_printer_dbl)
      subject.unlock
      subject.add_entry("entry 1")
      subject.add_entry("entry 2")
      subject.add_entry("entry 3")
      allow(secret_diary_printer_dbl).to receive(:print_all).with(["entry 1", "entry 2", "entry 3"]).and_return("entry 1\nentry 2\nentry 3\n")
      expect(subject.get_entries(secret_diary_printer_dbl)).to eq("entry 1\nentry 2\nentry 3\n")
    end

  #   it 'throws an error if trying to get all entries if the diary is locked' do
  #     subject.unlock
  #     subject.add_entry("entry 1")
  #     subject.add_entry("entry 2")
  #     subject.add_entry("entry 3")
  #     subject.lock

  #     expect { subject.get_entries }.to raise_error("The diary is locked")
  #   end
  end

end
