class AddressesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def new
    @address = Address.new
  end

  def create
    @address = Address.new address_params
    @address.user_id = current_user.id
    if @address.save
      redirect_to new_subscription_user_path
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:address, :city, :province, :postal_code, :country, :phone)
  end

end
