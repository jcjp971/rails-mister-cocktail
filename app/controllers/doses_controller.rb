class DosesController < ApplicationController
  before_action :set_doses, only: [:show]

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params["cocktail_id"])
  end

private

  def set_doses
    @doses = Doses.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end
end
