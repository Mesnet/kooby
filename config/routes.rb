Rails.application.routes.draw do

  
  #Companies
  resources :companies do 
    member do 
      patch :acc_invit
    end
  end

  #User
  devise_for :users, controllers: { registrations: "registrations" }
  resources :userinfos

  #Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # ROOT
  authenticated :user do
    root to: "pages#home", as: :authenticated_root
  end
  unauthenticated do
    root 'pages#landing'
  end

  #Test Page
  get "test" => "pages#test"

end