class RecipeSerializer
  # Find a recipe with a specified id
  def self.find_recipe(recipe)
    {
      data: {
        id: recipe[:idMeal],
        type: 'recipe',
        attributes: build_recipe_attributes(recipe)
      }
    }
  end

  # Attributes for finding a recipe
  def self.build_recipe_attributes(recipe)
    {
      name: recipe[:strMeal],
      picture: recipe[:strMealThumb],
      link: recipe[:strSource].nil? ? nil : recipe[:strSource],
      video_link: recipe[:strYoutube],
      cuisine_type: recipe[:strArea],
      ingredients: map_ingredients(recipe),
      directions: recipe[:strInstructions]
    }
  end

  # Error serializer
  def self.recipe_error(error, status)
    {
      data: {
        id: nil,
        type: 'error',
        attributes: {
          error_msg: error,
          status:
        }
      }
    }
  end
end

### Helper methods

## Create array of hashes with the key equaling the ingredients name and the value being the measurement
def map_ingredients(recipe)
  ingredients = (1..20).map do |i|
    ingredient = recipe[:"strIngredient#{i}"]
    measurement = recipe[:"strMeasure#{i}"]

    # If ingredient or measurement is nil or empty, skip this pair
    next if ingredient.blank? || measurement.blank?

    {
      quantity: measurement.strip,
      item: ingredient.strip
    }
  end

  # Remove the nil
  ingredients.compact
end
