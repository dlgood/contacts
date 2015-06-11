require_relative 'setup'
require_relative 'contact'
require_relative 'contact_database'
require 'pry'

option = ARGV[0]

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
  contact = Contact.create(first_name: first_name, last_name: last_name, email: email, phone: phone)
  puts "Contact saved for #{contact.first_name} #{contact.last_name}."

when "list"
  Contact.all.each do |contact|
    puts "ID: #{contact.id} \tName: #{contact.first_name} #{contact.last_name} \t\tEmail: #{contact.email}, \tPhone: #{contact.phone}"
  end

when "show"
  puts "Show. Please enter the id you would like to find."
  search_id = STDIN.gets.chomp.to_s
  result = Contact.where(id: search_id)
#refactor into general results returning
  result.all.each do |contact|
    puts "ID: #{contact.id} \tName: #{contact.first_name} #{contact.last_name} \t\tEmail: #{contact.email}, \tPhone: #{contact.phone}"
  end

when "find"
  puts "Find by last name. Please enter the last name to find."
  last_name = STDIN.gets.chomp.to_s
  result = Contact.where(last_name: last_name)
#refactor into general results returning
  result.all.each do |contact|
    puts "ID: #{contact.id} \tName: #{contact.first_name} #{contact.last_name} \t\tEmail: #{contact.email}, \tPhone: #{contact.phone}"
  end

when "update"
  puts "Update. Please enter the ID of the record to update."
  id = STDIN.gets.chomp.to_s
  puts "Please choose the field to update: first_name, last_name, email, or phone"
  field = STDIN.gets.chomp.to_sym
  puts "What would you like to change #{field} to say?"
  text = STDIN.gets.chomp.to_s
  contact = Contact.find_by(id: id)
  contact.update_attribute(field, "#{text}")
  puts "Update saved for id #{id}"

when "delete"
  puts "Delete. I'll assume you're sure. Please enter the ID of the record to delete."
  id = STDIN.gets.chomp.to_s
  contact = Contact.find_by(id: id)
  contact.destroy
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