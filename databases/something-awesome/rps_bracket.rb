# require gems
require 'sqlite3'
require 'faker'

data = SQLite3::Database.new( "rps.db" ) 