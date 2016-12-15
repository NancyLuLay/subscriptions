class SubscriptionUsersController < ApplicationController
  def new
  end

  def create
    @transaction = SubscriptionUser.new params.permit(:user_id, :subscription_id, :stripe_txn_id)
    stripe_customer = Stripe::Customer.create(
      description: "Payment for #{current_user.email}",
      source: params[:stripe_token]
    )
    current_user.stripe_customer_id = stripe_customer.id
    current_user.save
    stripe_charge = Stripe::Charge.create(
      amount: (session[:subscription_price] * 100).to_i,
      currency: "cad",
      customer: stripe_customer.id,
      description: "Payment for subscription #{session[:subscription_id]}"
    )
    byebug
    @transaction.user_id = current_user.id
    @transaction.subscription_id = session[:subscription_id]
    @transaction.stripe_txn_id = stripe_charge.id
    @transaction.save
    byebug
    if @transaction.save
      current_user.subscription_id = session[:subscription_id]
      current_user.save
      Card.create(card_id: stripe_customer.sources.data.first['id'], user_id: current_user.id)
      new_quantity = Subscription.find(session[:subscription_id]).quantity -=1
      old_quantity = Subscription.find(session[:subscription_id])
      old_quantity.update(quantity: new_quantity)
      redirect_to user_path(current_user.id), notice: "Payment completed!"
    else
    render :new
    end
  end

  def refund
    byebug
		charge = SubscriptionUser.find(params[:id]).stripe_txn_id
    create_refund = Stripe::Refund.create(:charge => charge)
    rescue Stripe::InvalidRequestError => e
       { success: 0, message: e.message }
    rescue Stripe::AuthenticationError => e
     { success: 0, message: e.message }
    rescue Stripe::APIConnectionError => e
     { success: 0, message: e.message }
    rescue Stripe::APIError => e
     { success: 0, message: e.message }
    byebug
		if create_refund.status == "succeeded"
			flash[:success] = "Refund Completed"
			redirect_to admin_subscription_users_path
		else
			flash[:error] = "Error Processing Refund"
			redirect_to admin_subscription_users_path
		end
	end

end
