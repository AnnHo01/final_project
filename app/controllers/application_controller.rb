class ApplicationController < ActionController::Base
  # before_action :authenticate_customer!
  before_action :set_variables, :initialize_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :province, :city, :street, :potal_code])
  end

  def set_variables
    @pet_groups_nav = PetGroup.includes(:breeds).page(params[:page])
  end

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    # You can pass an array of ids, and you'll get back a collection
    Breed.find(session[:shopping_cart])
    # pass an array of product id's.. get a collection of products!
  end
end
