class ChangeSavedRecipieDefault < ActiveRecord::Migration[7.0]
  def change
    ## Remove api_recipie_id default null 
    change_column_default(:saved_recipies, :api_recipie_id, nil)
    ## Change favorited default from null to false
    change_column_default(:saved_recipies, :favorited, false)
  end
end
