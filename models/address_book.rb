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
       if name < entry.name # sorting in alphabetical order a-z
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
   def binary_search(name) # => can you walk me through the While loop of the method
     lower = 0
     upper = entries.length - 1 # => is this subtracting one because we are checking the length of entries which will return 1 more then the # of the index of the last item? so we remove one to get the final items/objects index?
     while lower <= upper
       mid = (lower + upper) / 2
       mid_name = entries[mid].name # => gets the name of the middle entry in our array by index and sets it as the value of mid_name
       if name == mid_name
         return entries[mid] # => returns the index of the middle value
       elsif name < mid_name
         upper = mid - 1 # => subtracts one from the index of the middle value
       elsif
         lower = mid + 1 # => adds on to the index of the middle value
       end
     end
     return nil # => Why are we we still returning nil at the end?
  end
  def iterative_search(name) # => I tried to almost mimic the remove method and how it loops through by index and such. I think I am kind of close in my thought process.. Obviously it should some kind of each loop. It also needs to return the proper name/entry some how

    @entries.each do |entry|
      if name == entry.name
        return entry # => I had ommitted this at first but then realized my tests were failing because I was not returning the entry when my search had found it
      end
    end
    return nil
  end
 end
