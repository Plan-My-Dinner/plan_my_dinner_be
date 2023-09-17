class RecipeFacade
  def self.show_recipe(id)
    RecipeService.get_show_recipe(id)[:meals]
  end
end
