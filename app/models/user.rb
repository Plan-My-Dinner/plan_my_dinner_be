class User < ApplicationRecord
  ### The Regexp (ignoring case) checks that an email:
    ## Begins with at least one none space or "@" symbol character, captured data (local address)
    ## Has a "@" symbol
    ## The "@" is followed by at least one alphanumeric or dash character ending in a period, non-captured data (host)
    ## Ends with a minimum of 2 alpha characters, captured data (domain)

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  has_secure_password
end
