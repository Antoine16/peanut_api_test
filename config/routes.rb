Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'pages#home'


  resources :loans, only: [ :index, :show, :new, :create ]
  resources :users
  resources :credits, only: [ :index, :new, :create ]
  get '/sim' => 'pages#sim'
  get '/simul' => 'loans#simul'
  post 'cash_out' => 'loans#cash_out'
  post 'freeze' => 'loans#freeze'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
