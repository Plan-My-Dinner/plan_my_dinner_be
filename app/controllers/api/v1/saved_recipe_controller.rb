module Api
  module V1
    class SavedRecipeController < ApplicationController
      def show
        recipe = SavedRecipeFacade.show_recipe(params[:id])

        ## Return error if recipe data isn't present
        if recipe.id.nil?
          render json: SavedRecipeSerializer.recipe_error("No recipe has id #{params[:id]}", 503), status: :bad_request
        else
          render json: SavedRecipeSerializer.find_recipe(recipe), status: :ok
        end
      end
    end
  end
end
