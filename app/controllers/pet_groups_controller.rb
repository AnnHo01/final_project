class PetGroupsController < ApplicationController
  def index
    @pet_groups = PetGroup.includes(:breeds)
  end

  def show
    @pet_group = PetGroup.find(param[:id])
  end
end
