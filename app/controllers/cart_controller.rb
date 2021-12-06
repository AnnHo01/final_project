class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add params[:id] to cart
    # The logger will show in the rails server.. super useful for debugging!!
    breed_id = params[:id]
    logger.debug("Adding #{breed_id} to cart.")
    breed = Breed.find(breed_id)
    session[:shopping_cart] << breed_id.to_i
    redirect_to root_path
  end

  # DELETE /cart/:id
  def destroy
    # removes params[:id] from cart
  end
end
