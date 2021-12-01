class ApplicationController < ActionController::Base
  before_action :set_variables

  def set_variables
    @pet_groups = PetGroup.includes(:breeds)
  end
end
