class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:pet_group)
  end

  def show
    @breed = Breed.find(params[:id])
  end
end
