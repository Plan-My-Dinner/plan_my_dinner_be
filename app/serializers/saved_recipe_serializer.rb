class SavedRecipeSerializer
  # Find a recipe with a specified id
  def self.find_recipe(recipe)
    {
      data: {
        id: recipe.id,
        type: 'recipe',
        attributes: build_recipe_attributes(recipe)
      }
    }
  end

  # Attributes for finding a recipe
  def self.build_recipe_attributes(recipe)
    {
      name: recipe.name,
      picture: recipe.picture,
      link: recipe.link,
      video_link: recipe.video_link,
      cuisine_type: recipe.cuisine_type,
      ingredients: recipe.ingredients,
      directions: recipe.directions
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
