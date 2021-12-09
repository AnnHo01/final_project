class CheckoutController < ApplicationController
  def create

    # Establish a connection with stripe
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      line_items: cart.collect { |item| item.to_builder.attributes! },
    })
    # Redirect to stripe payment screen
    respond_to do |format|
      format.js #render app/views/checkout/create.js.erb
    end
  end

  def success
    # Transaction success
  end

  def cancel
    # Something went wrong
  end
end
