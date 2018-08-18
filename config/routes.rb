Rails.application.routes.draw do
  get 'ride_request/create'
  get 'ride_request/delete'
  get 'ride_request/update'
  get 'ride_request/destroy'

  controller :ride_request do
    post 'rides/:ride_id/requests' => :create, as: 'new_ride_request'
    get 'rides/:ride_id/requests' => :index, as: 'ride_requests'
    put 'rides/:ride_id/requests/:user_id' => :update, as: 'update_ride_request'
    delete 'rides/:ride_id/requests/:user_id' => :destroy, as: 'destroy_ride_request'
  end

  resources :rides
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
