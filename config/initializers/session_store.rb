# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_grunzillas_session',
  :secret      => '87165deb3c035cab97787b34ec7bcf137de0a5d7dc96f1c3352219d736d3fe0b26b353334c1397f0fee44b7d21a4ca9f1dfe1aa6be548cd688685b738bdf5f65'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
