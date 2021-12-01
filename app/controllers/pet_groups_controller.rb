class PetGroupsController < ApplicationController
  def index
    @pet_groups = PetGroup.includes(:breeds).page(params[:page])
  end

  def show
    @pet_group = PetGroup.find(params[:id])
    @pg_pag = @pet_group.breeds.page(params[:page])
  end
end
