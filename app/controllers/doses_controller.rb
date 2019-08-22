class DosesController < ApplicationController
  before_action :fetch_cocktail, except: :destroy
  # before_action :fetch_dose
  # def index
  #   @doses = Dose.where(@cocktail)
  # end
  def new
    @dose = Dose.new
  end
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cocktail)
  end

  private
  def fetch_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def fetch_dose
    @dose = Dose.find(params[:id])
  end
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
