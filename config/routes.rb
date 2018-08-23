Rails.application.routes.draw do

  root 'home#index', as: 'home_index'

  resources :rides
  resources :vehicles
  devise_for :users

  controller :history do
    get 'history' => :index, as: 'history_index'
  end

  controller :ride_request do
    get 'user/ride_requests' => :index, as: 'user_requests'
    post 'rides/:ride_id/requests' => :create, as: 'new_ride_request'
    get 'rides/:ride_id/requests' => :index, as: 'ride_requests'
    put 'rides/:ride_id/requests/:user_id' => :update, as: 'update_ride_request'
    delete 'rides/:ride_id/requests/:user_id' => :destroy, as: 'destroy_ride_request'
  end

  controller :users do
    get 'admin/users' => :index, as: 'users'
    get 'admin/users/:id' => :show, as: 'user'
    delete 'admin/users/:id' => :destroy, as: 'delete_user'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
