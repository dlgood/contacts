require_relative 'contact_database'
require_relative 'connect'

class Contact

  attr_reader :id, :first_name, :email, :last_name, :phone

  def initialize(id, first_name, last_name, email, phone)
    @id
    @email = email
    @first_name = first_name
    @last_name = last_name
    @phone = phone
  end
 
  def save
    contact_save_result = ContactDatabase.save(self)
  end

  private
  def self.to_array(search_results)
    result = []
    search_results.each do |row|
      result << Contact.new(row["id"], row["first_name"], row["last_name"], row["email"], row["phone"])
    end
    if result == []
      puts "Sorry, no results found."
    else
      result
    end
  end
 
  def list_all_contacts
    @@all_contacts.each {|x| puts x }
  end

  # def self.create(email, first_name, last_name)
  #   # Adding a new data field requires adding in self.create, self.new, contact_to_array, attr_reader
  #   id = @@all_contacts.length + 1
  #   new_contact = self.new(id, email, first_name, last_name)
    
  #   # add self to contacts in memory
  #   @@all_contacts << new_contact
    
  #   # add self to CSV
  #   new_contact_array_for_csv = new_contact.contact_to_array
  #   ContactDatabase.add_contact(new_contact_array_for_csv)
  # end

  # def self.all_contacts(data_from_file)
  #   @@all_contacts = data_from_file
  # end

  def self.searchable_contacts
    searchable_contacts = @@all_contacts #.map(&:downcase)
    # searchable_contacts
  end
end

