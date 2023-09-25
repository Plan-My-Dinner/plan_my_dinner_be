class Recipe
  attr_reader :id, :error, :type, :attributes, :name, :picture, :link, :video_link, :cuisine_type, :ingredients, :directions

  def initialize(data)
    @error = data.nil?
    return if @error

    @id = data[:idMeal]
    @name = data[:strMeal]
    @picture = data[:strMealThumb]
    @link = data[:strSource].nil? ? nil : data[:strSource]
    @video_link = data[:strYoutube]
    @cuisine_type = data[:strArea]
    @directions = data[:strInstructions]
    @ingredients = map_ingredients(data)
  end

  def map_ingredients(data)
    ingredients = (1..20).map do |i|
      ingredient = data[:"strIngredient#{i}"]
      measurement = data[:"strMeasure#{i}"]

      next if ingredient.blank? || measurement.blank?

      {
        quantity: measurement.strip,
        item: ingredient.strip
      }
    end

    ingredients.compact
  end
end
