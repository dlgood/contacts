## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'

class ContactDatabase

  def self.save(contact)
    contact_save_result = $conn.exec_params("INSERT INTO contacts (first_name, last_name, email, phone) VALUES ('#{contact.first_name}', '#{contact.last_name}', '#{contact.email}', '#{contact.phone}');")
  end

  def self.find(last_name)
    search_results = $conn.exec_params("SELECT * FROM contacts WHERE last_name = $1", [last_name])
    results_array = Contact.to_array(search_results)
    results_array.each do |contact|
    puts "ID: #{contact.id} Full Name: #{contact.first_name} #{contact.last_name} Email: #{contact.email} Phone: #{contact.phone}"
    end
    puts "-------\n"
    puts "#{results_array.length} results found."
  end

  def self.list
    pg_result = $conn.exec_params('SELECT * FROM contacts')
    results_array = Contact.to_array(pg_result)
    results_array.each do |contact|
    puts "ID: #{contact.id} Full Name: #{contact.first_name} #{contact.last_name} Email: #{contact.email} Phone: #{contact.phone}"
    end
    puts "-------\n"
    puts "#{results_array.length} results found."
  end

  # def self.show(search_id)
  #   puts "You searched for ID #{search_id}."
  #   contact_list = Contact.searchable_contacts
  #   results = contact_list.select {|contact| contact[0].include?(search_id)}
  #   if results != []
  #     puts "Results:"
  #     puts results
  #     puts "------"
  #     puts "Records found : #{results.count}"
  #   else
  #     puts "Sorry, no matching contacts found."
  #   end
  # end


  def self.check_email_uniqueness(new_email)
    results = Contact.searchable_contacts.select {|contact| contact[1].include?(new_email)}
    if results != [] 
      puts "Sorry, that email is already used by a contact. Emails must be unique. Try again or hit Ctrl C to exit."
      puts "Email?"
      new_email = STDIN.gets.chomp.to_s
      check_email_uniqueness(new_email)
    end
  end
end

