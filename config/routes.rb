Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    authenticated :user do
      root 'tweets#index'
    end
    unauthenticated :user do
      root 'devise/sessions#new'
    end
  end
  resources :users, only: [:index, :show, :edit, :update], param: :username
  resources :tweets, except: :destroy
end
