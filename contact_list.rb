require_relative 'contact_database'
require_relative 'contact'
require 'pry'

option = ARGV[0]

Contact.all_contacts(CSV.read('contacts.csv')) 
# p Contact.all_contacts

puts "WELCOME TO THE CONTACTINATOR 3000"

case option
when "add"
  puts "Add contact \n(Press Enter to skip a particular field)"
  puts "Email?"
  email = STDIN.gets.chomp.to_s
    # TODO add check for uniqueness
  puts "First name?"
  first_name = STDIN.gets.chomp.to_s
  puts "Last name?"
  last_name = STDIN.gets.chomp.to_s
  # puts "Street Address?"
  # address = STDIN.gets.chomp.to_s
  # puts "City?"
  # city = STDIN.gets.chomp.to_s
  # puts "State?"
  # state = STDIN.gets.chomp.to_s
  # puts "Phone?"
  # phone = STDIN.gets.chomp.to_s
  Contact.create(email, first_name, last_name)

when "list"
  puts "List"

when "show"
  puts "Show"

when "find"
  puts "Find. Please enter the search term."
  search_term = STDIN.gets.chomp.to_s
  ContactDatabase.find(search_term)

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