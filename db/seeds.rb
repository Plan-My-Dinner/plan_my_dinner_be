## Register a user
user = User.create!(email: 'random@test.com', password: 'password123', password_confirmation: 'password123')

### Error where the attribute favortied has to be true or else it fails the validation check 
## Save a recipie with the id of 1
recipie = SavedRecipie.create!(user_id: user.id, api_recipie_id: 1, favorited: true)