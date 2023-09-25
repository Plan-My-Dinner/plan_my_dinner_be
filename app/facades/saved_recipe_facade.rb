class SavedRecipeFacade
  def self.show_recipe(id)
    data = SavedRecipeService.get_show_recipe(id)
    if data[:meals].nil?
      Recipe.new(data[:meals])
    else
      Recipe.new(data[:meals][0])
    end
  end
end
