class CocktailsController < ApplicationController
  before_action :fetch_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end
  def new
    @cocktail = Cocktail.new
  end
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end
  def show
    @dose_list = @cocktail.doses
  end
  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
  def fetch_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
