class Chefs::ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end
end