class SavedRecipie < ApplicationRecord
  ## VALIDATIONS
  validates :api_recipie_id, numericality: { only_integer: true }
  validates :favorited, inclusion: [true, false]
  validates_associated :user

  ## RELATIONSHIPS
  belongs_to :user
end
