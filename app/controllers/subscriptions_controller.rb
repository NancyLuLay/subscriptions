class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    @subscription = Subscription.all
  end

  def show
    @subscription = Subscription.find params[:id]
    session[:subscription_price] = @subscription.price
    session[:subscription_title] = @subscription.title
    session[:subscription_id] = @subscription.id
  end

end
