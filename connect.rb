require 'pg'  # gem install pg    Postgres gem
require 'pry'

# Establish a connection to the database (requires internet since it's on heroku!)
# Note: You'll want to put in your own heroku creds
puts 'Connecting to the database...'
$conn = PG.connect(
  host: 'localhost',
  dbname: 'contacts',
  user: 'development',
  password: 'development'
)



# puts 'Closing the connection...'
# # $conn.close

# puts 'DONE'