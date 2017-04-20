class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def create
    @dose = Dose.new(doses_params)
    if @dose.save
      redirect_to @dose.cocktail
    else
      render 'new'
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail: @cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end
end
