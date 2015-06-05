require_relative 'contact_database'

class Contact
  attr_accessor :first_name, :email, :last_name, :street, :city, :state, :phone

  def initialize(email:, first_name:, last_name:)
    @email = email
    @first_name = first_name
    @last_name = last_name
    # @steet = street
    # @city = city
    # @state = state
    # @phone = phone
  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(submitted_user_info)
      new_contact = self.new(submitted_user_info)
      puts "New contact created with this info: #{new_contact}"
      new_contact_data = new_contact # (@email, @firstname, @lastname)
      puts "New contact created with this info: #{new_contact_data.inspect}" 
      ContactDatabase.add_contact(new_contact_data)
    end
 
    def find(index)
      # TODO: Will find and return contact by index
    end
 
    def all
      # TODO: Return the list of contacts, as is
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
    end
  end
end

