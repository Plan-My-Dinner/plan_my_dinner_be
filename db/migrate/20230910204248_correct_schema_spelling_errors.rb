class CorrectSchemaSpellingErrors < ActiveRecord::Migration[7.0]
  def change
    rename_column :saved_recipies, :api_recipie_id, :api_recipe_id
    rename_table :saved_recipies, :saved_recipes
    rename_column :scheduled_recipies, :saved_recipie_id, :saved_recipe_id
    rename_table :scheduled_recipies, :scheduled_recipes
  end
end
