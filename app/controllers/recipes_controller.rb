 class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
      if params[:sort]
        @recipes = Recipe.order(:prep_time)
      end
  end

  

  def show
    @recipe = Recipe.find_by(id: params[:id])

    @ingredient_list = @recipe.ingredients.split(", ")
    @direction_list = @recipe.directions.split (", ")
  end


  def new
  end

  def create
    @recipe = Recipe.create({title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions]})

    flash[:success]= "New Recipe Created"
    redirect_to '/recipes'
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    @recipe.update({title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions]})
    flash[:success] = "Recipe Updated"

    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    flash[:warning] = "Recipe Destroyed"

    redirect_to "/recipes"
  end

end
