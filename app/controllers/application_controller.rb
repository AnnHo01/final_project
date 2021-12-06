class ApplicationController < ActionController::Base
  before_action :set_variables

  def set_variables
    @pet_groups_nav = PetGroup.includes(:breeds).page(params[:page])
  end
end
