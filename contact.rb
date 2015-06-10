require_relative 'contact_database'

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

  def update(id, field, text)
    contact_update_result = ContactDatabase.update(id, field, text)
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
 
end

