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
      puts entry.to_s
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
      delete_entry(entry)
    when "e"
      edit_entry(entry)
      entry_submenu(entry)
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      p "#{selection} is not valid."
      entries_submenu(entry)
    end

  end

  def search_submenu(entry)
    p "\nd - delete entry"
    p "e - edit this entry"
    p "m - return to main menu"
    # => prints out the list of commands for the user

    selection = gets.chomp # => takes the user input in response to the command list and sets it equal to a variable

    case selection # => processes the users input and carries out methods in response to what options they picked
    when "d"
      system "clear"
      delete_entry(entry)
      main_menu
    when "e"
      edit_entry(entry)
      system "clear"
      main_menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      p "#{selection} is not a valid input"
      p entry.to_s # => why is this line all the way down here? What is it doing at this point.
      search_submenu(entry)
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

  def search_entries # can you explain this to me?
    print "Search by name: "
    name = gets.chomp # => gets user input and sets it to variable name

    match = @address_book.binary_search(name) # => Can you explain this
    system "clear"

    if match
      p match.to_s
      search_submenu(match)
    else
      p "No match found for #{name}"
    end

  end

  def delete_entry(entry)
    @address_book.entries.delete(entry) # => runs the ruby delete method to remove an entry from address book
    p "#{entry.name} has been deleted" # => prints confirmation of the deletion of the entry
  end

  def edit_entry(entry)

    print "Updated name: "
    name = gets.chomp # => sets a local variable of name equal to the user input of new name
    print "Updated phone #: "
    phone_number = gets.chomp # => sets a local variable of phone_number equal to the user input of new phone numbder
    print "Updated email: " # => sets a local variable of a email to the user input of new name
    email = gets.chomp

    entry.name = name if !name.empty? # => sets entry.name to name if name is not empty
    entry.phone_number = phone_number if !phone_number.empty? # => sets entry.phone_number to phone_number if it is not emptry
    entry.email = email if !email.empty? # => does same as above ## exclmation says is not or tests if it is not remember !=
    system "clear" # => clears the console/terminal window

    p "Updated entry: "
    entry # => returns the updated entry do I need to do this for code in the line below this to work?
    p "Name: #{entry.name} Phone Number: #{entry.phone_number} Email: #{entry.email}" # => my take on what the checkpoint asked. I wanted to clean up the return instead of printing out @name = "Austin" or something like that
  end

  def read_csv
    print "Enter CSV file to import: "
    file_name = gets.chomp # => sets a variable equal to the user input of file_name

    if file_name.empty? # => checks to see if the file is empty
      system "clear" # => clears the console menu
      p "No data in the CSV file to read." # => puts a message to the user
      main_menu # => returns to the main menu
    end

    begin
      entry_count = @address_book.import_from_csv(file_name).count # => what is this counting? The entries?
      system "clear"
      p "#{entry_count} new entries added from #{file_name}"
    rescue
      p "#{file_name} is not a valid file. Please try again."
      read_csv # => reruns the method if the
    end

  end

end
