class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @components = Component.all

    @components_values = []
    @components.each {|component|
      subhash=[]
      subhash << "#{component.project_name} - #{component.release_version}"
      subhash << component.id
      @components_values << subhash
      }
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(recipe_id)
    @recipe.destroy
  end



end
