class ApplicationController < ActionController::Base
  before_action :set_variables, :initialize_session
  helper_method :cart

  def set_variables
    @pet_groups_nav = PetGroup.includes(:breeds).page(params[:page])
  end

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    # You can pass an array of ids, and you'll get back a collection
    Product.find[session[:shopping_cart]]
    # pass an array of product id's.. get a collection of products!
  end
end
