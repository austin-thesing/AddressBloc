require_relative 'entry'
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

   def remove_entry(name,phone_number,email)
     if (name == name.entry) && (email == email.entry) && (phone_number = phone_number.entry)
       entry.delete
     else
       p "Entry does not exist \n Please try again."
     end
   end
 end
