class User < ApplicationRecord
  ### The Regexp (ignoring case) checks that an email:
    ## Begins with at least one none space or "@" symbol character, captured data (local address)
    ## Has a "@" symbol
    ## The "@" is followed by at least one alphanumeric or dash character ending in a period, non-captured data (host)
    ## Ends with a minimum of 2 alpha characters, captured data (domain)

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: { case_sensitive: false }
  has_secure_password

  ## RELATIONSHIPS
    # Specifies assocation name and that a users saved recipies are deleted when the user is
  has_many :saved_recipies, class_name: 'SavedRecipie', dependent: :destroy

  has_many :scheduled_recipies, through: :saved_recipies
end
