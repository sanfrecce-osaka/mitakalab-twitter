Rails.application.routes.draw do
  resources :users, only: [:index, :show, :edit, :update], param: :username
  resources :tweets, except: :destroy
end
