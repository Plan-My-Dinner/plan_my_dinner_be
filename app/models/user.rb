class User < ApplicationRecord
  ### This Regexp checks that an email: 
  # \A - start of string
  # (...) - capture group
  # [...] - list of possible characters (eg: a or b) not a and b
  # + - occurs one or more times

  # ^ - Matches beginning of line or when in [] matches any character except those named
  # @ - Literally looking for @ symbol
  # \s - whitespace character
  # (?:...) - non-captured group (will not be returned in captured data but must be a match) 
  # - = literally the dash character
  # a-z - the range of lowercase letters a-z
  # 0-9 - the range of numbers 0-9
  # \. - A period
  # {2,} - occurs 2 or more times
  # \z - matches end of string
  # /i - ignore case
  
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  has_secure_password
end
