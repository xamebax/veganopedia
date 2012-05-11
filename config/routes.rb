Veganopedia::Application.routes.draw do
  opinio_model

  devise_for :users
  # root :to => 'devise/registrations#new'
  devise_scope :user do
    root :to => 'users#index'
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  resources :users, :only => [:index, :show]
  resources :products, :only => [:index, :show, :new, :create, :edit, :update, :destroy] do
    opinio
  end
end
