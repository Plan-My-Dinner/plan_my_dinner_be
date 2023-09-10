class ScheduledRecipe < ApplicationRecord
  ## RELATIONSHIPS
  belongs_to :saved_recipe
  has_one :user, through: :saved_recipe

  ## VALIDATIONS
  validates :scheduled_date, presence: true
  validates_associated :saved_recipe
end
