class CheckoutController < ApplicationController
  def create

    # Establish a connection with stripe
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}",
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
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
    # Something went wrong
  end
end
