Veganopedia::Application.routes.draw do
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  end
  # root :to => 'devise/registrations#new'
  devise_scope :user do
    root :to => 'users#index'
  end
  resources :users, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
end
