Veganopedia::Application.routes.draw do
  devise_for :users
  # root :to => 'devise/registrations#new'
  devise_scope :user do
    root :to => 'users#index'
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  resources :users, :only => [:index, :show, :edit, :update, :destroy]
  resources :products, :only => [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, :only => [:index, :create]
  end
end
