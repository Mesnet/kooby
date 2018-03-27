Rails.application.routes.draw do


  devise_for :users, controllers: { registrations: "registrations" }
  resources :companies

  patch "userinfo" => "companies#userinfo"

  # ROOT
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  authenticated :user do
    root to: "pages#home", as: :authenticated_root
  end
  unauthenticated do
    root 'pages#landing'
  end

  get "test" => "pages#test"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end