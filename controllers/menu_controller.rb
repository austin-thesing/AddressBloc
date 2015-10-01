require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    p "Main Menu -- #{@address_book.entries.count} Total Entries"
    p "1 - View all entries"
    p "2 - Create an entry"
    p "3 - Search for an entry"
    p "4 - Import entries from a CSV"
    p "5 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      p "Good Bye"

      exit(0) # What does this do?
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end
  def view_all_entries
    system "clear"
    @address_book.entries.each do |entry|
      p entry.to_s
      entry_submenu(entry)
    end
    p "End of entries"
  end
  def entry_submenu(entry)
    p "n - next entry"
    p "d - delete entry"
    p "e - edit this entry"
    p "m - return to main menu"

    selection = gets.chomp
    case selection
    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      p "#{selection} is not valid."
      entries_submenu(entry)
    end
  end
  def create_entry
    system "clear"
    p "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone = gets.chomp # Why is this phone when in address_book it is phone_number?
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name,phone,email) # Why is this phone when in address_book it is phone_number?

    system "clear"
    p "New entry created"
  end
  def search_entries

  end
  def read_csv

  end
end
