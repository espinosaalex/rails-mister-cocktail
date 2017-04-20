class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to @dose.cocktail
    else
      render 'new'
    end
  end

  def new
    @dose = Dose.new
  end
end
