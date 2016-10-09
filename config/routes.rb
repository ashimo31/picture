Rails.application.routes.draw do

  devise_for :users
  resources :photos, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
       post :confirm
     end
   end

   root 'top#index'
end
