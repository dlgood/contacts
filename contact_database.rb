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

  def self.show(search_id)
    puts "You searched for ID #{search_id}."
    contact_list = Contact.searchable_contacts
    results = contact_list.select {|contact| contact[0].include?(search_id)}
    if results != []
      puts "Results:"
      puts results
      puts "------"
      puts "Records found : #{results.count}"
    else
      puts "Sorry, no matching contacts found."
    end
  end

  def self.list
    puts "All contacts:\n"
    Contact.searchable_contacts.each do |x| 
      puts "#{x[0]}: #{x[2]} #{x[3]} (#{x[1]}) \n" 
    end
    puts "------"
    puts "Records found : #{Contact.searchable_contacts.count}"
  end

  def self.find(search_term)
    puts "You searched for #{search_term}."
    contact_list = Contact.searchable_contacts
    results = contact_list.select {|contact| contact.include?(search_term)}
    # binding.pry
    if results != []
        puts "Results:"
      results.each do |x| 
        puts "#{x[0]}: #{x[2]} #{x[3]} (#{x[1]}) \n" 
      end
      puts "------"
      puts "Records found : #{results.count}"
    else
      puts "Sorry, no matching contacts found."
    end
  end
end

