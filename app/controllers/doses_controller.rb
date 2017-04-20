class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = Cocktail.find(@dose.cocktail_id)
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'new'
    end
  end

  def new
    @cocktail = Cocktail.find(doses_params[:cocktail_id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  private

  def doses_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end
end
