## TODO: Implement CSV reading/writing
require 'csv'

class ContactDatabase

  def self.add_contact(new_contact)
    csv_data = new_contact
    p "The data going to the CSV is #{csv_data}"
    File.open('contacts.csv', 'wb') do |csv|
    csv << csv_data
    end
  end

  def find_contact

  end

  def show_contact_details
  end

  def list_all_contacts
  end
end

