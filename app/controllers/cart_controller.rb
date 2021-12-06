class CartController < ApplicationController
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add params[:id] to cart
    # The logger will show in the rails server.. super useful for debugging!!
    logger.debug("Adding #{params[:id]} to cart.")
  end

  # DELETE /cart/:id
  def destroy
    # removes params[:id] from cart
  end
end
