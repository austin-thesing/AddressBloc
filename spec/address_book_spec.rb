require_relative "../models/address_book.rb"

RSpec.describe AddressBook do
  describe "attributes" do
    it "should respond to entries" do
     book = AddressBook.new
     expect(book).to respond_to(:entries)
   end

   it "should initialize entries as an array" do
     book = AddressBook.new
     expect(book.entries).to be_a(Array)
   end

   it "should initialize entries as an empty array" do
     book = AddressBook.new
     expect(book.entries.size).to eq(0)
   end
  end
  describe "#add_entry" do
    it "adds only a single entry to the Address Book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end
  end
end
