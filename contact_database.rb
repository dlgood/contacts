## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

class ContactDatabase

  def self.add_contact(new_contact)
    puts "Adding #{new_contact} to csv."
    CSV.open("contacts.csv", "ab") do |csv|
      csv << new_contact
    end
    puts "#{new_contact[2]} was added, with an ID of #{new_contact[0]}."
  end

  def show_contact_details
  end

  def self.find(search_term)
    puts "You searched for #{search_term}."
    contact_list = Contact.searchable_contacts
    results = contact_list.select {|contact| contact.include?(search_term)}
    # binding.pry
    if results != []
        puts "Results:"
      results.each do |x| 
        puts "ID: \t\t #{x[0]}"
        puts "Email: \t\t #{x[1]}"
        puts "First name: \t #{x[2]}"
        puts "Last name: \t #{x[3]}"
      end
    else
      puts "Sorry, no matching contacts found."
    end
  end
end

