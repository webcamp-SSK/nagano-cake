Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/new'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'orders/index'
    get 'orders/show'
    get 'orders/new'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
