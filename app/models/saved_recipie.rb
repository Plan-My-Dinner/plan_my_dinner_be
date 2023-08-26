class SavedRecipie < ApplicationRecord
  ## VALIDATIONS
    validates :user_id, presence: true
    validates :api_recipie_id, presence: true
    validates :favorited, presence: true

  ## RELATIONSHIPS
    belongs_to :user
    has_many :scheduled_recipies
end
