## TODO: Implement CSV reading/writing
require 'csv'

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

  def list_all_contacts
  end

  def self.find(search_term)
    puts "You are searching for #{search_term}."
    #p Contact.all_contacts[0][1].include?("Seymour")
    contact_list = Contact.all_contacts[0]
    results = contact_list.select {|contact| contact.include?(search_term)}
    puts "DONE"
    p results[0][1]
    if results != nil
      puts results
    else
      puts "Sorry, no matching contacts found."
    end
  end

end

