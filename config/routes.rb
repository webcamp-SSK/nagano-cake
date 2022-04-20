Rails.application.routes.draw do
  scope module: :public do
    resource :customers, only: [:edit, :update] do
      get 'my_page' => 'customers#show'
      get 'unsubscribe' => 'customers#unsubscribe'
      patch 'withdraw' => 'customers#withdraw'
    end
  end
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      delete 'destroy_all' => 'cart_items#destroy_all'
    end

    resource :orders, only: [:new, :create] do
      post 'confirm' => 'orders#confirm'
      get 'complete' => 'orders#complete'
    end

    resources :orders, only: [:index, :show]


    resources :addresses, except: [:new, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
