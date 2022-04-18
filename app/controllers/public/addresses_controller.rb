class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
    @address = Address.new

  end

  def edit
  end

  def create
    @address = current_customer.addresses.new(address_params)
    if @address.save
      redirect_to request.referer
    else
      render :index
    end
  end

  def update
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end

  private

    def address_params
      params.require(:address).permit(:postal_code, :address, :name)
    end

end
