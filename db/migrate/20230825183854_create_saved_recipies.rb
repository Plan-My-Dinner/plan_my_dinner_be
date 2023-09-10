class CreateSavedRecipies < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_recipies do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :api_recipie_id, null: false
      t.boolean :favorited

      t.timestamps
    end
  end
end
