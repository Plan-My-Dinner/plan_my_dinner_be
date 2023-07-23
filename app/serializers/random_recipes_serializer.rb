class RandomRecipesSerializer
  include JSONAPI::Serializer

  def self.api_format(recipes)
    serialized_recipes = recipes.map do |recipe|
      {
        ID: recipe[:idMeal],
        Title: recipe[:strMeal],
        Image_URL: recipe[:strMealThumb]
      }
    end

    {
      Recipes: serialized_recipes
    }
  end
end
