module Api
  module V1
    class RandomRecipesController < ApplicationController
      def index
        recipes = RandomRecipesFacade.random_recipes(params[:count].to_i)
        render json: serialize(recipes), status: :ok
      end

      private

      def serialize(recipes)
        RandomRecipesSerializer.api_format(recipes)
      end
    end
  end
end
