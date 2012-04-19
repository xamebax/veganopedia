Veganopedia::Application.routes.draw do
  devise_for :users
  # root :to => 'devise/registrations#new'
  devise_scope :user do
    root :to => 'users#index'
  end
  resources :users, :only => [:new, :create, :index, :show, :edit, :update, :destroy]
end
