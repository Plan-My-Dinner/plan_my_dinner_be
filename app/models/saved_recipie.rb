class SavedRecipie < ApplicationRecord
  ## VALIDATIONS
    validates :user_id, presence: true
    validates :user, presence: true
    validates :api_recipie_id, numaricality: {only_integer: true}
    validates :favorited, inclusion: [true, false]

  ## RELATIONSHIPS
    belongs_to :user
    # has_many :scheduled_recipies
end
