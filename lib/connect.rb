####################################################
# The only purpose of this library is to establish
# a connection with the SQLite3 database.  It will
# be loaded by every top-level script that needs to
# access the database.
####################################################

require 'active_record'
require 'i18n'

puts "Establishing connection..."

ActiveRecord::Base.establish_connection({
  adapter:  "sqlite3",

  ### Heh.  Copy-pasta.
  database: "./library.db"
})

puts "Connected!"


# Let's get rid of those annoying 'I18n.enforce_available_locales'
# deprecation warnings:
I18n.enforce_available_locales = true