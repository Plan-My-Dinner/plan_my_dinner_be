class MealDbService
  BASE_URL = 'https://www.themealdb.com'.freeze

  def self.random_recipe
    get('/api/json/v1/1/random.php')
  end

  def self.get(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: BASE_URL)
  end
end
