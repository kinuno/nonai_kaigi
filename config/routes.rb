Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only:[:index, :new, :create, :edit, :update, :destroy] do
    resources :characters, only:[:new, :create, :show, :edit, :update, :destroy]
    resources :comments, only:[:index, :create, :destroy]
  end
end
