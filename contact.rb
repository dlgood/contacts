require_relative 'contact_database'

class Contact

  @@all_contacts = []

  attr_reader :first_name, :email, :last_name, :street, :city, :state, :phone

  def initialize(id, email, first_name, last_name)
    @id = id
    @email = email
    @first_name = first_name
    @last_name = last_name
    # @steet = street
    # @city = city
    # @state = state
    # @phone = phone
  end
 
  def contact_to_array
    [@id, @email, @first_name, @last_name]
  end
 
  def list_all_contacts
    @@all_contacts.each {|x| puts x }
  end

  def self.create(email, first_name, last_name)
    # Adding a new data field requires adding in self.create, self.new, contact_to_array, attr_reader
    id = @@all_contacts.length + 1
    new_contact = self.new(id, email, first_name, last_name)
    
    # add self to contacts in memory
    @@all_contacts << new_contact
    
    # add self to CSV
    new_contact_array_for_csv = new_contact.contact_to_array
    ContactDatabase.add_contact(new_contact_array_for_csv)
  end

  def self.all_contacts(data_from_file)
    @@all_contacts = data_from_file
  end

  def self.searchable_contacts
    searchable_contacts = @@all_contacts #.map(&:downcase)
    # searchable_contacts
  end
end

