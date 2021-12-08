class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add params[:id] to cart
    # The logger will show in the rails server.. super useful for debugging!!
    logger.debug("Adding #{params[:id]} to cart.")
    breed_id = params[:id].to_i
    session[:shopping_cart] << breed_id

    breed = Breed.find(breed_id)
    flash[:notice] = "➕ #{breed.name} added to cart."

    redirect_to pet_groups_path
  end

  # DELETE /cart/:id
  def destroy
    # removes params[:id] from cart
    logger.debug("Removing #{params[:id]} from cart.")
    breed_id = params[:id].to_i
    session[:shopping_cart].delete(breed_id)

    breed = Breed.find(breed_id)
    flash[:notice] = "➖ #{breed.name} Removed from cart."

    redirect_to pet_groups_path
  end
end
