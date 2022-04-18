class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @addresses = current_customer.address
    @address = Address.new
    
  end

  def edit
  end

  def create
    @address = current_customer.address.new(address_params)
    @address.save
  end

  def update
  end

  def destroy
  end
end
