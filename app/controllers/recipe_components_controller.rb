class RecipeComponentsController < ApplicationController
  def create
    @recipe_component = RecipeComponent.new(params[:recipe_component])
    @recipe_component.save
    redirect_to recipe_path(Recipe.find(params[:recipe_component][:recipe_id]))




  end
  def new

  end
end
