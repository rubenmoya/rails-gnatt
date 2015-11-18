Rails.application.routes.draw do

  root 'gantt#index'

  devise_for :users
  resources :projects do
    resources :tasks
  end
end
