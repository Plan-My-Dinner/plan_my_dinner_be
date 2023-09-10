## Register a user
user = User.create!(email: 'random@test.com', password: 'password123', password_confirmation: 'password123')

### Error where the attribute favorted has to be true or else it fails the validation check
## Save a recipe with the id of 1
recipie = SavedRecipie.create!(user_id: user.id, api_recipie_id: 1, favorited: true)

## Schedule a recipe
ScheduledRecipie.create(saved_recipie_id: recipie.id, scheduled_date: DateTime.new(2006, 8, 5, 15, 5, 15))