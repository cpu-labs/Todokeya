# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Todokeya_session',
  :secret      => '7f2535b464717c49706ec197ea0573ad9480a8b5aac9acea4920342b1d52b5f399908bc63d33de475108310f26e1329df8608c3a786e3e6ce17eddfc508f7651'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
