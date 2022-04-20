class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!

  def show
  end

  def edit
    @customer = current_customer
  end

  def update
    if current_customer.update(customer_params)
      redirect_to my_page_customers_path
    else
      @customer = current_customer
      render 'public/customers/edit'
    end
  end

  def destroy
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def unsubscribe
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  private

    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                       :postal_code, :address, :telephone_number, :email)
    end

end
