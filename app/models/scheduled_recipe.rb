class ScheduledRecipe < ApplicationRecord
  ## RELATIONSHIPS
  belongs_to :saved_recipe
  has_one :user, through: :saved_recipe

  ## VALIDATIONS
  validates :saved_recipe_id, presence: true
  validates :scheduled_date, presence: true
end