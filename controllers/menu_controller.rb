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
    p "5 - View Entry n"
    p "6 - Exit"
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
      system "clear"
      view_entry_n_submenu
      main_menu
    when 6
      p "Good Bye"

      exit(0) # Says that it is exiting without and error message
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end
  def view_entry_n_submenu
    print "What entry # do you want to access?: "
    sel_n = gets.chomp.to_i #to_i because case statement is expecting Integers
    if sel_n < @address_book.entries.count #checks to see if sel_n is longer then the index
      p @address_book.entries(sel_n) #puts address_book.entries and the selection by index
      p "Hit any key to return to the Main Menu: "
      gets.chomp
      system "clear"
    else
      p "#{sel_n} is not a valid entry in AddressBloc please try again" #prints out their entry and provides reason it was not returned
      view_entry_n_submenu # => Brings the submenu back up
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
