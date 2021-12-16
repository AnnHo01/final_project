class CartController < ApplicationController
  before_action :authenticate_customer!
  # POST /cart
  # Data sent as form data (params)
  def create
    # Add params[:id] to cart
    # The logger will show in the rails server.. super useful for debugging!!
    logger.debug("Adding #{params[:id]} to cart.")
    breed_id = params[:id].to_i
    session[:shopping_cart] << breed_id

    breed = Breed.find(breed_id)
    breed.update(qty: params[:qty])
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
    breed.update(qty: 1)
    flash[:notice] = "➖ #{breed.name} Removed from cart."

    redirect_to pet_groups_path
  end

  # Cart summary
  def summary
    prov_id = current_customer.province.id
    @prov = Province.find(prov_id)

    subtotal = 0
    cart.each do |breed|
      subtotal += breed.price * breed.qty
    end
    if @prov.pst.nil?
      pst = 0
    else
      pst = @prov.pst
    end
    if !@prov.hst.nil?
      hst = @prov.hst
    else
      hst = @prov.gst + pst
    end
    total = subtotal * (1 + hst)

    order = current_customer.orders.find_or_create_by(
      total: total,
      gst: @prov.gst,
      pst: pst,
      hst: hst,
      status: "new"
    )
  end

  # Update cart when user input the quantity
  def update
    breed = Breed.find_by_name(params[:name])
    breed.update(qty: params[:qty])
    redirect_to cart_summary_path
  end
end
