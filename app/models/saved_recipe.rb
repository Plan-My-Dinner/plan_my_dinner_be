class SavedRecipe < ApplicationRecord
  ## RELATIONSHIPS
  belongs_to :user
  has_many :scheduled_recipes, dependent: :destroy

  ## VALIDATIONS
  validates :api_recipe_id, numericality: { only_integer: true }
  validates :favorited, inclusion: [true, false]
  validates_associated :user
end
