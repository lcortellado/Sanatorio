Rails.application.routes.draw do
  resources :audits
  devise_for :users
  resources :especialidades
  resources :dashboards
    root to: 'dashboards#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
