require_relative 'contact_database'
require_relative 'contact'
require 'pry'

option = ARGV[0]

# Contact.all_contacts(CSV.read('contacts.csv')) 
# p Contact.all_contacts

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

when "list"
  ContactDatabase.list

# when "show"
#   puts "Show. Please enter the id you would like to find."
#   search_id = STDIN.gets.chomp.to_s
#   ContactDatabase.show(search_id)

when "find"
  puts "Find by last name. Please enter the last name to find."
  last_name = STDIN.gets.chomp.to_s
  ContactDatabase.find(last_name)

when "help"
  puts "\nHere is a list of available commands:\n
  \tnew  - Create a new contact
  \tlist - List all contacts
  \tshow - Show a contact
  \tfind - Find a contact
  \n "

else puts
  "Invalid input, boyo"
end
# binding.pry