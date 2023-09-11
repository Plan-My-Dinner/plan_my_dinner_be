## Register a user
user = User.create!(email: 'random@test.com', password: 'password123', password_confirmation: 'password123')

## Save a recipe with the id of 1
recipe = SavedRecipe.create!(user_id: user.id, api_recipe_id: 1, favorited: true)

## Schedule a recipe
ScheduledRecipe.create(saved_recipe_id: recipe.id, scheduled_date: DateTime.new(2006, 8, 5, 15, 5, 15))