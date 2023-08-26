class ScheduledRecipie < ApplicationRecord
  ## VALIDATIONS
    validates :saved_recipie_id, presence: true
    validates :scheduled_date, presence: true

  ## RELATIONSHIPS
  belongs_to :saved_recipie
  has_one :user, through: :saved_recipie
end
  