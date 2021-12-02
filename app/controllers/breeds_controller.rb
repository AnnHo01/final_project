class BreedsController < ApplicationController
  def index
    @breeds = Breed.includes(:pet_group, :pets).page(params[:page])
  end

  def show
    @breed = Breed.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    breed_search = params[:breed]
    breed_search_2 = breed_search[:pet_group_id]
    puts breed_search_2
    if(breed_search_2.empty?)
      @breeds = Breed.where("name LIKE ?", wildcard_search).page(params[:page])
      if @breeds
        @breeds = Breed.where("description LIKE ?", wildcard_search).page(params[:page])
      end
    else
      @breeds = Breed.where("lower(name) LIKE ? AND pet_group_id = ?", wildcard_search, breed_search_2).page(params[:page])

      if @breeds
        @breeds = Breed.where("lower(description) LIKE ? AND pet_group_id = ?", wildcard_search, breed_search_2).page(params[:page])
      end
    end
  end
end
