Veganopedia::Application.routes.draw do
  devise_for :users
  # root :to => 'devise/registrations#new'
  devise_scope :user do
    root :to => 'devise/registrations#new'
  end
end
