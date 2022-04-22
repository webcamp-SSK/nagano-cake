class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end


  def create
    @addresses = current_customer.addresses
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash.now[:notice] = "配送先の新規登録をしました。"
    else
      @addresses = current_customer.addresses
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先を編集しました。"
      redirect_to addresses_path
    else
      render :edit
    end

  end

  def destroy
    @addresses = current_customer.addresses
    @address = Address.find(params[:id])
    @address.destroy
    flash.now[:notice] = "配送先を削除しました。"
  end

  private

    def address_params
      params.require(:address).permit(:postal_code, :address, :name)
    end

end
