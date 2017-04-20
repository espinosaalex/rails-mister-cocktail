class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @restaurant.save
      redirect_to @cocktail
    else
      render 'new'
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end