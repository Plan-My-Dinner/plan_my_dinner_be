module Api
  module V1
    class RecipeController < ApplicationController
      def show
        recipe = RecipeFacade.show_recipe(params[:id])
        if recipe.nil?
          # Pass error message and status code
          render json: RecipeSerializer.recipe_error("No recipe has id #{params[:id]}", 503), status: :bad_request
        else
          render json: RecipeSerializer.find_recipe(recipe[0]), status: :ok
        end
      end
    end
  end
end
