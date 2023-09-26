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
    # Change string block in array of strings
    @directions = data[:strInstructions].split("\r\n")
    @ingredients = map_ingredients(data)
  end

  # Turn the 20 ingredient and measurmentattributes into an array of 20 hashes
  def map_ingredients(attributes)
    ingredients = (1..20).map do |i|
      ingredient = attributes[:"strIngredient#{i}"]
      measurement = attributes[:"strMeasure#{i}"]

      next if ingredient.blank? || measurement.blank?

      {
        quantity: measurement.strip,
        item: ingredient.strip
      }
    end

    ingredients.compact
  end
end
