new_contact = "hsimpson@gmail.com, Homer, Simpson, 543 Evergreen Terr, Springfield, OR, 4155555555, \n"
File.open('contacts.csv', 'a') do |csv|
  csv << new_contact
  end