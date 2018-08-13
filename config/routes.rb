Rails.application.routes.draw do
  resources :vehicles
  root 'home#index', as: 'home_index'

  devise_for :users

  controller :users do
    get 'admin/users' => :index, as: 'users'
    get 'admin/users/:id' => :show, as: 'user'
    delete 'admin/users/:id' => :destroy, as: 'delete_user'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
