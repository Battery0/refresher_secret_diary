require 'secret_diary_printer'

describe SecretDiaryPrinter do

  describe '#print_all' do
    it 'prints all diary entries' do
      diary_entries = ["entry 1", "entry 2", "entry 3"]

      expect { subject.print_all(diary_entries) }.to output("entry 1\nentry 2\nentry 3\n").to_stdout
    end
  end

end