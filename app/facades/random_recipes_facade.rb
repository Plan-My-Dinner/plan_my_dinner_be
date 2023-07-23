class RandomRecipesFacade
  def self.random_recipes(count)
    results = []
    while results.length < count
      recipe = MealDbService.random_recipe
      results << recipe[:meals][0] unless results.include?(recipe[:meals][0])
    end
    results
  end
end
