## TODO: Implement CSV reading/writing
require 'csv'
require 'pry'
require 'pg'

class ContactDatabase

  def self.connect_to_db
    puts 'Connecting to the database...'
    conn = PG.connect(
    host: 'localhost',
    dbname: 'contacts',
    user: 'development',
    password: 'development'
    )
  end

  def self.close
    puts 'Closing the connection...'
    connect_to_db.close
    puts 'Connection closed.'
  end

  def self.save(contact)
    contact_save_result = connect_to_db.exec_params("INSERT INTO contacts (first_name, last_name, email, phone) VALUES ('#{contact.first_name}', '#{contact.last_name}', '#{contact.email}', '#{contact.phone}');")
  end

  def self.update(id, field, text)
    contact_update_result = connect_to_db.exec_params("UPDATE contacts SET #{field} = '#{text}' WHERE id = #{id};")
  end

  def self.delete(id)
    contact_delete_result = connect_to_db.exec_params("DELETE FROM contacts WHERE id = #{id};")
  end

  def self.find(last_name)
    search_results = connect_to_db.exec_params("SELECT * FROM contacts WHERE last_name = $1", [last_name])
    results_array = Contact.to_array(search_results)
    results_array.each do |contact|
    puts "ID: #{contact.id} Full Name: #{contact.first_name} #{contact.last_name} Email: #{contact.email} Phone: #{contact.phone}"
    end
    puts "-------\n"
    puts "#{results_array.length} results found."
  end

  def self.show(id)
    search_results = connect_to_db.exec_params("SELECT * FROM contacts WHERE id = $1", [id])
    results_array = Contact.to_array(search_results)
    results_array.each do |contact|
    puts "ID: #{contact.id} Full Name: #{contact.first_name} #{contact.last_name} Email: #{contact.email} Phone: #{contact.phone}"
    end
    puts "-------\n"
    puts "#{results_array.length} results found."
  end

  def self.list
    pg_result = connect_to_db.exec_params('SELECT * FROM contacts')
    results_array = Contact.to_array(pg_result)
    results_array.each do |contact|
    puts "ID: #{contact.id} Full Name: #{contact.first_name} #{contact.last_name} Email: #{contact.email} Phone: #{contact.phone}"
    end
    puts "-------\n"
    puts "#{results_array.length} results found."
  end


  # def self.check_email_uniqueness(new_email)
  #   results = Contact.searchable_contacts.select {|contact| contact[1].include?(new_email)}
  #   if results != [] 
  #     puts "Sorry, that email is already used by a contact. Emails must be unique. Try again or hit Ctrl C to exit."
  #     puts "Email?"
  #     new_email = STDIN.gets.chomp.to_s
  #     check_email_uniqueness(new_email)
  #   end
  # end
end

