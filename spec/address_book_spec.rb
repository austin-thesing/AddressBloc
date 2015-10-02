require_relative "../models/address_book"

RSpec.describe AddressBook do
  let(:book) {AddressBook.new} # => lets us use the book variable in every test

  describe "attributes" do
    it "should respond to entries" do
     # book = AddressBook.new # => Replaced by line 4
     expect(book).to respond_to(:entries)
   end

   it "should initialize entries as an array" do
     # book = AddressBook.new # => Replaced by line 4
     expect(book.entries).to be_a(Array)
   end

   it "should initialize entries as an empty array" do
     # book = AddressBook.new # => Replaced by line 4
     expect(book.entries.size).to eq(0)
   end
  end
  describe "#add_entry" do
    it "adds only a single entry to the Address Book" do
      # book = AddressBook.new # => Replaced by line 4
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end
    it "adds the correct information to entries" do
      # book = AddressBook.new # => Replaced by line 4
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end
  # added remove entry test
  describe "#remove_entry" do
    it "should remove a single entry" do
      # book = AddressBook.new # => Replaced by line 4
      book.add_entry('Austin Thesing', '800.445.8833','austin@thesing.xyz')
      expect(book.entries.size).to eq(1)

      book.remove_entry('Austin Thesing', '800.445.8833','austin@thesing.xyz')
      expect(book.entries.size).to eq(0)
    end
  end
  def check_entry(entry,expected_name,expected_phone_number, expected_email)
    expect(entry.name).to eql(expected_name)
    expect(entry.phone_number).to eql(expected_phone_number)
    expect(entry.email).to eql(expected_email)
  end
  describe "#import_from_csv" do
    it "import an entry from a CSV file" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eq 5 #checks the size of the book
    end
    it "adds the first entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one,"Mark Griffo","123456789","mark@bloc.com")
    end
    it "adds the second entry" do
      book.import_from_csv("entries.csv")
      entry_two = book.entries[1]
      check_entry(entry_two,"Natalie Griffo","123456789","natalie@bloc.com")
    end
    it "adds the third entry" do
      book.import_from_csv("entries.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Steve Thesing", "8583878899", "steve@steve.com")
    end
    it "adds the fourth entry" do
      book.import_from_csv("entries.csv")
      entry_four = book.entries[3]
      check_entry(entry_four, "Haidee Thesing", "8584458833", "h@thesing.com")
    end
    it "adds the fifth entry" do
      book.import_from_csv("entries.csv")
      entry_five = book.entries[4]
      check_entry(entry_five, "Olivia Meers", "0987654321", "olivia@meers.com")
    end
  end
end
