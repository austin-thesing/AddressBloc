require_relative 'entry'
require "csv"
class AddressBook
   attr_accessor :entries

   def initialize
     @entries = []
   end

# => Can you please explain what the whole add_entry method is really doing
   def add_entry(name,phone_number,email)
     index = 0
     @entries.each do |entry|
       if name < entry.name
         break
       end
       index += 1
     end
     @entries.insert(index, Entry.new(name, phone_number, email))
   end

   def import_from_csv(file_name)
     csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
       #can you clarify what the above is doing
       #is the format of row_hash["name"] because it is iterating over a hash or because it is an array?
     end
   end

   def remove_entry(name,phone_number,email)
     index = 0 # => basically says start at the first index
     @entries.each do |entry| #loops through all the entries in @entry
       if (name == entry.name) && (email ==  entry.email) && (phone_number = entry.phone_number)
         break # => if the entry is found break from the loop and delete at that index
       end
       index += 1 # => if the statement is false it bumps up the index and passes throug the loop again
     end
     @entries.delete_at(index) # => deletes at the index where the entry exsists 
   end
 end
