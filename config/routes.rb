Rails.application.routes.draw do
  root to: 'static#home'
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show] do 
    resources :vehicles do 
      resources :mechanics
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
