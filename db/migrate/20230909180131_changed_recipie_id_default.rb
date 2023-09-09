class ChangedRecipieIdDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_null :saved_recipies, :api_recipie_id, false

  end
end
