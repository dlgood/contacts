require_relative 'contact_database'
require_relative 'contact'
require 'pry'

option = ARGV[0]
ContactDatabase.connect_to_db

puts "WELCOME TO THE CONTACTINATOR 3000"

case option
when "add"
  puts "Add contact \n(Press Enter to skip a particular field)"
  puts "Email?"
  email = STDIN.gets.chomp.to_s
  # ContactDatabase.check_email_uniqueness(email)
    # TODO add check for uniqueness
  puts "First name?"
  first_name = STDIN.gets.chomp.to_s
  puts "Last name?"
  last_name = STDIN.gets.chomp.to_s
  puts "Phone?"
  phone = STDIN.gets.chomp.to_s
  #create contact
  contact = Contact.new(nil, first_name, last_name, email, phone)
  
  #save contact in postgres
  contact.save
  puts "Contact saved for #{first_name} #{last_name}."
  ContactDatabase.close

when "list"
  ContactDatabase.list
  ContactDatabase.close

when "show"
  puts "Show. Please enter the id you would like to find."
  search_id = STDIN.gets.chomp.to_s
  ContactDatabase.show(search_id)
  ContactDatabase.close

when "find"
  puts "Find by last name. Please enter the last name to find."
  last_name = STDIN.gets.chomp.to_s
  ContactDatabase.find(last_name)
  ContactDatabase.close

when "update"
  puts "Update. Please enter the ID of the record to update."
  id = STDIN.gets.chomp.to_s
  puts "Please choose the field to update: first_name, last_name, email, or phone"
  field = STDIN.gets.chomp.to_s
  puts "What would you like to change this field to say?"
  text = STDIN.gets.chomp.to_s
  ContactDatabase.update(id, field, text)
  puts "Update saved for id #{id}"

when "delete"
  puts "Delete. I'll assume you're sure. Please enter the ID of the record to delete."
  id = STDIN.gets.chomp.to_s
  ContactDatabase.delete(id)
  puts "Deletion of ID #{id} complete. I hope you were serious!"  

when "help"
  puts "\nHere is a list of available commands:\n
  \tnew  - Create a new contact
  \tlist - List all contacts
  \tshow - Show a contact
  \tfind - Find a contact
  \tupdate - Update a contact
  \tdelete - Delete a contact
  \n "

else puts
  "Invalid input, boyo"
end
# binding.pry