Rails.application.routes.draw do
  resources :users, only: [:index, :show], param: :username
  resources :tweets, except: :destroy
end
