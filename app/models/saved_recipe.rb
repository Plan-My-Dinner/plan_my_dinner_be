class SavedRecipe < ApplicationRecord
  ## RELATIONSHIPS
  belongs_to :user

  ## VALIDATIONS
  validates :api_recipe_id, numericality: { only_integer: true }
  validates :favorited, inclusion: [true, false]
  validates_associated :user
end
