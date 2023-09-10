class CreateScheduledRecipies < ActiveRecord::Migration[7.0]
  def change
    create_table :scheduled_recipies do |t|
      t.references :saved_recipie, foreign_key: true, null: false
      t.datetime :scheduled_date

      t.timestamps
    end
  end
end
