class SavedRecipeService
  def self.conn
    Faraday.new('https://www.themealdb.com')
  end

  def self.get_show_recipe(id)
    response = conn.get("/api/json/v1/1/lookup.php?i=#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
